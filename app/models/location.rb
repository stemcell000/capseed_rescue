class Location < ActiveRecord::Base
  belongs_to :building
  has_many :containers
end
