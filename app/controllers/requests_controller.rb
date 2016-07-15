class RequestsController < ApplicationController

	# GET /requests
	# GET /requests.json
	def index
		if params[:date_from] or params[:date_to]
			params[:date_from]||= Time.now.to_s(:db)
			params[:date_to]||= Time.now.to_s(:db)

			my_date_from = params[:date_from].to_datetime.to_s(:db)
			my_date_to = params[:date_to].to_datetime.to_s(:db)

			@requests_and_project = Request.joins(:project).where("requests.date >= '#{my_date_from}' and requests.date <= '#{my_date_to}'")
		end

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
