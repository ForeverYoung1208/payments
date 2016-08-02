class AAccount < ActiveRecord::Base
	has_many :b_payments
end
