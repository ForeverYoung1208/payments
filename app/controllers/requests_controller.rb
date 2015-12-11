class RequestsController < ApplicationController
	def index
		@requests = Request.all
#		respond_to do |format|
#			format.html {} # show.html.erb
#			format.json { render json: @requests }
#		end
	end
end
