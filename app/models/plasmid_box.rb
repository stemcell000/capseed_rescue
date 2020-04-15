class PlasmidBox < ActiveRecord::Base
  has_many :plasmid_batches, :inverse_of => :box
  accepts_nested_attributes_for :plasmid_batches
end
