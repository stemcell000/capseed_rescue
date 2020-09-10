class PlasmidBox < ActiveRecord::Base
  has_many :plasmid_batches
  accepts_nested_attributes_for :plasmid_batches
  validates :name, :presence => true
end
