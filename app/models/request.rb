class Request < ActiveRecord::Base
	belongs_to :project
	has_many :a_payments
	has_many :b_payments

	def sum
		rand (100)
	
	end


end
