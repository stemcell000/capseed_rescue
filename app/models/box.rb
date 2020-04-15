class Box < ActiveRecord::Base
  has_many :positions
  has_many :virus_batches, through: :positions
  belongs_to :box_format
  belongs_to :box_type
  
  accepts_nested_attributes_for :virus_batches
  
  def generate_positions
    position_name = []
    max_position = self.box_type.vertical_max*self.box_type.horizontal_max
    #
    rows = ('a'..'z').to_a[0..(self.box_type.horizontal_max-1)]
    cols = (1..26).to_a[0..(self.box_type.vertical_max-1)]
    #
    rows.each do |r|
      cols.each do|c|
        position_name.push("#{r}#{c}")
      end
    end
    #
    total_range = (0..(max_position-1)).to_a
    total_range.each{
      |i| self.positions.create(nb: i, name: position_name[i])
    }
  end
  
end
