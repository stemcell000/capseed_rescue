class Shelf < ActiveRecord::Base
  belongs_to :container
  has_many :boxes
  has_many :virus_batches, as: :vb_link
end
