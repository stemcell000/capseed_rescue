class Box < ActiveRecord::Base
  has_many :plasmid_batches, :inverse_of => :box
  has_many :positions
  has_many :virus_batches, as: :vb_link
  belongs_to :box_format
  
  accepts_nested_attributes_for :plasmid_batches, :allow_destroy => true
  accepts_nested_attributes_for :virus_batches, :allow_destroy => true
end
