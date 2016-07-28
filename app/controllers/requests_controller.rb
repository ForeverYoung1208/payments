class RequestsController < ApplicationController

	# GET /requests
	# GET /requests.json
	def index
		
		@requests_and_project = Request.all
		@requests_and_project = @requests_and_project.where("requests.date >= ?", params[:date_from].to_datetime.to_s(:db) ) if params[:date_from]
		@requests_and_project = @requests_and_project.where("requests.date <= ?", params[:date_to].to_datetime.to_s(:db) ) if params[:date_to]
		@requests_and_project += Request.where("requests.date is null").to_a


		respond_to do |format|
			format.html {} # index.html.erb
			format.json {} # index.json.jbuilder
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

	# GET /requests/1/aPayments
	# GET /requests/1/aPayments.json
	def apayments
		@request = Request.find(params[:id])
		respond_to do |format|
			format.html # show.html.erb
			format.json {} # aPayments.json.jbuilder
		end
	end	

	def bpayments
		@request = Request.find(params[:id])
		respond_to do |format|
			format.html # show.html.erb
			format.json {} # bPayments.json.jbuilder
		end
	end	


	# PUT /requests/1
	# PUT /requests/1.json
	def update
		@request = Request.unscoped.find(params[:id])

		respond_to do |format|
			if @request.update_attributes( update_request_params )
				format.json { render json: @request, status: :created }				
			else
				format.json { render json: @request.errors, status: :unprocessable_entity }
			end
		end
	end

	# POST /requests
	# POST /requests.json
	def create
		@request = Request.new( update_request_params )

		respond_to do |format|
			if @request.save
				format.json { render json: @request, status: :created }				
			else
				format.json { render json: @request.errors, status: :unprocessable_entity }
			end
		end
	end




	private

	def update_request_params
		params.permit(:id, :date, :project_id, :is_deleted)
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
