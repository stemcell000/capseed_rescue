class Building < ActiveRecord::Base
  has_many :locations
  has_many :containers, through: :locations
end
