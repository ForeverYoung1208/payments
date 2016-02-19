class Request < ActiveRecord::Base
	belongs_to :project

	def sum
		rand (100)
	
	end


end
