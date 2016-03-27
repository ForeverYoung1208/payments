class Request < ActiveRecord::Base
	belongs_to :project
	has_many :a_payments
	has_many :b_payments

	class SumError < StandardError
	end

	def sum
		sum_a == sum_b ? sum_a : raise( SumError, "Помилка: суми за платежами та за заявками різні" )
	end
	
	def sum_b
		b_payments.sum( :sum )
	end

	def sum_a
		a_payments.sum( :sum )
	end



end
