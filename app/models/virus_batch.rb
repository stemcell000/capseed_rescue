class VirusBatch < ActiveRecord::Base
  
  belongs_to :virus_production
  belongs_to :column
  belongs_to :row
  belongs_to :vol_unit
  belongs_to :position
  
  accepts_nested_attributes_for :virus_production
  accepts_nested_attributes_for :column
  accepts_nested_attributes_for :row
  
  #validations
  validates :name, :volume, :vol_unit_id, :presence => true
  validates :name, :uniqueness => {message: "This name is already taken."}
  
def set_tube_status
  str = self.volume == 0 ? (self.trash? ? "/images/empty-med.png" : "/images/trash.png") : "/images/full-med.png"
  
  unless self.trash?
    case self.volume
      when 0
        str="/images/empty-med.png"
      when 0..50
        str="/images/full-med-very-low.png"
      when 50..100
        str="/images/full-med-low.png"
      when 100..500
        str="/images/full-med-half.png"
       when 500..1000
        str="/images/full-med-high.png"
      else
       str=  "/images/empty-med.png"
     end
   else
       str = self.trash? ? "/images/trash.png":"/images/empty-med.png"
   end
  return str
end

def generate_recap
  block1 = "#{self.name}"
  block2 = "#{ self.virus_production.number }"
  block3 = "#{self.virus_production.recap}"
  block = block1+block2+block3
  self.update_columns(:recap => block)
end
  
end
