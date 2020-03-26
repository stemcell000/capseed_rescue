class Container < ActiveRecord::Base
  belongs_to :location
  has_many :shelves
end
