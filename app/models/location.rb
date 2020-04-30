class Location < ActiveRecord::Base
  belongs_to :building
  has_many :containers
  has_many :shelves, through: :containers
end
