class Container < ActiveRecord::Base
  belongs_to :location
  has_many :shelves
  has_many :boxes, through: shelves
end
