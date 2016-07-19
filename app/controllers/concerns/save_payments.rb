module SavePayments
	extend ActiveSupport::Concern

	def create

		@request = Request.find( params[:requestid] )


		if params[:apayment]
			@payment = APayment.new( payment_params ) 
			@request.a_payments << @payment
		elsif params[:bpayment]
			@payment = BPayment.new( payment_params ) 
			@request.b_payments << @payment
		end

		respond_to do |format|
			if @payment.save
				format.json { render json: @payment, status: :created }
			else
				format.json { render json: @payment.errors, status: :unprocessable_entity }
			end
		end


	end
	
	def update

		@payment = APayment.unscoped.find(params[:apayment][:id]) if params[:apayment]
		@payment = BPayment.unscoped.find(params[:bpayment][:id]) if params[:bpayment]

		respond_to do |format|
			if @payment.update_attributes( payment_params )
				format.json { head :ok }
			else
				format.json { render json: @payment.errors, status: :unprocessable_entity }
			end
		end
	end

end