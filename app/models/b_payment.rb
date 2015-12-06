class BPayment < ActiveRecord::Base
  belongs_to :b_account
  belongs_to :request
end
