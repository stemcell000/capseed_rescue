class Position < ActiveRecord::Base
  belongs_to :box
  has_one :virus_batch
  
  before_destroy :check_for_box

private

def check_for_box  
  unless box.nil?     
    self.errors[:base] << "Cannot delete position while its box exists."
    return false   
  end 
end 
end
