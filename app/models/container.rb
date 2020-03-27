class Container < ActiveRecord::Base
  belongs_to :location
  has_many :shelves
  has_many :virus_batches, as: :vb_link
end
