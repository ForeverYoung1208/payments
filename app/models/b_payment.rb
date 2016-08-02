class BPayment < ActiveRecord::Base
	belongs_to :b_account
  belongs_to :request
  belongs_to :a_account
  belongs_to :resourcer




  validates :b_account, presence: true
  
  default_scope { where( is_deleted: false ) }
  
end
