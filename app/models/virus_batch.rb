class VirusBatch < ActiveRecord::Base
  belongs_to :virus_production
  belongs_to :vol_unit
  belongs_to :position
  
  accepts_nested_attributes_for :virus_production
  accepts_nested_attributes_for :position
  
  #validations
  validates :name, :volume, :vol_unit_id, :presence => true
  validates :name, :uniqueness => {message: "This name is already taken."}
  
def generate_recap(vp)
  block1 = "#{self.name} "
  block2 = "#{ vp.number }"
  block3 = "#{vp.recap}"
  block = block1+block3
  self.update_columns(:recap => block)
end

def set_tube_status
  str = ""
  if self.virus_production
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
         str = "/images/trash.png"
     end
    else
      str = "/images/no-parent.png"
    end
  return str
end

def set_draggable
  str=""
  unless self.trash?
    str= "draggable"
  end
  return str
end

def set_color_from_position
    str=""
    str = self.position.nil? ? "text-danger" : "text-success"
    return str
end
  
end
