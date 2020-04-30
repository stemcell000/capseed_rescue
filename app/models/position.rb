class Position < ActiveRecord::Base
  belongs_to :box
  has_one :virus_batch
end
