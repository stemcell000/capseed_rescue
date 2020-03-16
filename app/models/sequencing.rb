class Sequencing < ActiveRecord::Base
 has_and_belongs_to_many :clone_batches
 has_and_belongs_to_many :qc_attachments, :dependent => :destroy 
 has_many :primers
 belongs_to :user
 
 accepts_nested_attributes_for :qc_attachments, :allow_destroy => true, :reject_if => :all_blank
 accepts_nested_attributes_for :primers, :reject_if => :all_blank
 
# validates :date_rec, :date => {:before_or_equal_to => :date_send, :message => 'must be after or equal to the date of sending.'}, :allow_blank => true
end
