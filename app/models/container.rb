class Container < ActiveRecord::Base
  belongs_to :location
  has_many :shelves
  
  accepts_nested_attributes_for :shelves
  
end
