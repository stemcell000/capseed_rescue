class CloneBatch < ActiveRecord::Base
  #ActiveModel Dirty to track changes
  include ActiveModel::Dirty
  #scopes
  scope :by_production,  ->(production_id) { joins(:productions).where(productions: { id: production_id }) }
  #call-back
  after_create :create_insert
  after_update :update_insert
  #Set to nil blank fields values (utile pour effacer le final name à l'étape CBQC - rename)
  before_save :normalize_blank_values
  belongs_to :clone
  has_and_belongs_to_many :options
  has_many :plasmid_batches, -> { distinct }, :dependent => :destroy
  has_and_belongs_to_many :sequencings, :dependent => :destroy
  has_and_belongs_to_many :pcr_colonies, :dependent => :destroy
  has_and_belongs_to_many :productions, :join_table => "clone_batches_productions"
  has_many :virus_productions, :through => :productions
  belongs_to :target
      
  has_many :clone_batch_attachments, :dependent => :destroy
  has_many :clone_batch_as_plasmid_attachments, :dependent => :destroy
  belongs_to :type
  has_one :insert, :dependent => :destroy, :autosave => true
  belongs_to :strand
  belongs_to :origin
  has_and_belongs_to_many :genes, :join_table => "clone_batches_genes"
  has_and_belongs_to_many :promoters, :join_table => "clone_batches_promoters"

  def normalize_blank_values
    attributes.each do |column, value|
      self[column].present? || self[column] = nil
    end
  end
  
  #accepts_nested_attributes_for :clone
  accepts_nested_attributes_for :sequencings, :allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :pcr_colonies, :allow_destroy => true, reject_if: :all_blank
  accepts_nested_attributes_for :clone_batch_attachments, :allow_destroy => true
  accepts_nested_attributes_for :clone_batch_as_plasmid_attachments, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :plasmid_batches, :allow_destroy => true, :reject_if => :all_blank
  accepts_nested_attributes_for :insert
  accepts_nested_attributes_for :strand
  accepts_nested_attributes_for :type
  accepts_nested_attributes_for :genes, :allow_destroy => false, :reject_if => :all_blank
  accepts_nested_attributes_for :promoters, :allow_destroy => false, :reject_if => :all_blank
  accepts_nested_attributes_for :origin
  accepts_nested_attributes_for :options
  #Validations
  attr_accessor :skip_name_validation
  attr_accessor :skip_type_validation
  attr_accessor :skip_batch_validation
  attr_accessor :skip_strict_validation
  
  # clone_sample -> validates :temp_name, :presence => true unless :skip_strict_validation
  validates :name, presence: true, uniqueness: true unless :skip_name_validation
  validates :type, presence: true
  validates :strand, presence: true
  validates :glyc_stock_box_as_plasmid, :strand, :presence => true unless :skip_batch_validation
  validates_format_of :name, :with => /(\w|\s)/, :multiline => true unless :skip_name_validation
   
  #scope pour limiter la liste affichée par l'autocomplete du formulaire de plasmid_design
  scope :plasmid_allow,-> {where.not(:strand_id=> nil)}
  
  def custom_label
     "#{number} | #{name}"
  end
  
  def autocomplete_display
    self.uniq
  end


  def self.to_csv
    attributes = %w{number name construction promoter gene batches date_as_plasmid}

    CSV.generate(headers: true, :col_sep => ";") do |csv|
      csv << attributes

      all.each do |object|
        csv << [
          object.number.nil? ? "" : object.number,
          object.name.nil? ? "" : object.name,
          object.clone.nil? ? "" : object.clone.name,
          object.promoters.uniq.nil? ? "" : object.promoters.pluck(:name).to_sentence,
          object.genes.uniq.nil? ? "" : object.genes.pluck(:name).to_sentence,
          object.plasmid_batches_count,
          object.date_as_plasmid.nil? ? "" : object.date_as_plasmid,
        ]
      end
    end
  end
  
   def generate_recap
    
      number= self.nb.nil? ? '-' : self.nb 
      date_as_plasmid = self.date_as_plasmid.nil? ? '-' : self.date_as_plasmid.strftime('%b %e, %Y')
      glyc_stock_box_as_plasmid = self.glyc_stock_box_as_plasmid.nil? ? 'No data' : self.glyc_stock_box_as_plasmid
      origin = self.origin.nil? ? '-' : self.origin.name
      type = self.type.nil? ? '-' : self.type.name
      nb_of_batches = self.plasmid_batches.empty? ? '-' : self.plasmid_batches.length
      clone = self.clone.nil? ? '-' : self.clone.name
      target = self.target.nil? ? '-' : self.target.name
      strand  = self.strand.nil? ? '-' : self.strand.name
      promoters = self.promoters.nil? ? '-' : self.promoters.uniq.map {|promoter| promoter.name}.to_sentence
      genes = self.genes.nil? ? '-' : self.genes.uniq.map {|gene| gene.name}.to_sentence
      comment = self.comment_as_plasmid.nil? ? '' : ' '+self.comment_as_plasmid
      
       block = "<i class='glyphicon glyphicon-inbox'></i> <strong>Number: </strong> #{ number } <br />
       <i class='glyphicon glyphicon-calendar'></i> <strong> Date: </strong> #{ date_as_plasmid} <br />
       <i class='glyphicon glyphicon-inbox'></i> <strong>Glycerol stock box: </strong> #{glyc_stock_box_as_plasmid } <br />
       <i class='glyphicon glyphicon-home'></i> <strong>Origin: </strong> #{ origin } <br />
       <i class='glyphicon glyphicon-inbox'></i> <strong>Type: </strong> #{ type }<br />
       <i class='glyphicon glyphicon-th'></i> <strong>Number of batches: </strong> #{ nb_of_batches }<br />
       <strong>Clone: </strong> #{clone } <br />
       <strong>Target: </strong> #{ target } <br />
       <strong>Strand: </strong> #{ strand } <br />
       <strong>Promoter: </strong> #{ promoters } <br />
       <strong>Gene: </strong> #{ genes }<br />
       <strong>Comments: </strong> #{ comment } <br />"
      
      
      self.update_columns(:recap => block)
      
  end
  
  def create_insert
    insert = Insert.new(:name => self.name, :number => self.number, :dismissed => self.dismissed)
    self.insert = insert
  end

  def update_insert
    if self.insert.nil?
      create_insert
    else
      insert = self.insert
      insert.update_attributes(:name => self.name, :number => self.number, :dismissed => self.dismissed)
    end
  end

  private
  
  def enable_strict_validation?
    self.strict_validation == 1
  end
  
  def enable_plasmid_validation?
    self.plasmid_validation == 1
  end

  def enable_inventory_validation?
    self.inventory_validation == 1
  end
  
  def pb_count
    self.plasmid_batches.count
  end
  
  enum status: {
    yes: 1,
    no: 0
  }
end
