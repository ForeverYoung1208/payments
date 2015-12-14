class RequestsController < ApplicationController

	# GET /requests
	# GET /requests.json
	def index
		@requests_and_project = Request.joins(:project)
		respond_to do |format|
			format.html {} # show.html.erb
			format.json {} # show.html.json.jbuilder
		end
	end

	# GET /requests/1
	# GET /requests/1.json
	def show
		@request = Request.find(params[:id])
		respond_to do |format|
			format.html # show.html.erb
			format.json { render json: @request }
		end
	end	

	# PUT /requests/1
	# PUT /requests/1.json
	def update
		@request = Request.find(params[:id])

		respond_to do |format|
			if @request.update_attributes(params[:request])
				format.json { head :no_content }
			else
				format.json { render json: @request.errors, status: :unprocessable_entity }
			end
		end
	end

end
