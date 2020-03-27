class Position < ActiveRecord::Base
  belongs_to :box
  belongs_to :virus_batch
end
