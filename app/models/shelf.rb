class Shelf < ActiveRecord::Base
  belongs_to :location
  has_many :boxes
end
