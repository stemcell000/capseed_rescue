class Building < ActiveRecord::Base
  has_many :locations
  has_many :containers, through: :locations
  has_many :virus_batches, as: :vb_link
end
