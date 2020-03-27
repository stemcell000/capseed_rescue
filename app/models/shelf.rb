class Shelf < ActiveRecord::Base
  belongs_to :location
  has_many :boxes
  has_many :virus_batches, as: :vb_link
end
