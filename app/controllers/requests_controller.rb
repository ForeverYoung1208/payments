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

  # POST /contacts
  # POST /contacts.json
  # def create
  #   @contact = Contact.new(params[:contact])
    
  #   respond_to do |format|
  #     if @contact.save
  #       format.html { redirect_to contacts_path, notice: 'Contact was successfully created.' }
  #       format.json { render json: @contact, status: :created, location: @contact }
  #     else
  #       format.html { render action: "new" }
  #       format.json { render json: @contact.errors, status: :unprocessable_entity }
  #     end
  #   end

  # end


  # GET /contacts/new
  # GET /contacts/new.json
  # def new
  #   @contact = Contact.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @contact }
  #   end
  # end


end
