class Location < ActiveRecord::Base
  belongs_to :building
  has_many :containers
  has_many :shelves, through: :containers
  has_many :virus_batches, as: :vb_link
end
