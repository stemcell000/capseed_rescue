class Pbox < ActiveRecord::Base
  has_many :plasmid_batches
  validates :name, :presence => true
end
