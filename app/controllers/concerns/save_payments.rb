module SavePayments
	extend ActiveSupport::Concern

	def create

		@request = Request.find( params[:requestid] )


		if params[:apayment]
			@payment = APayment.new( payment_params ) 
			@request.a_payments << @payment

		elsif params[:bpayment]
			bpayment_params = payment_params
			bpayment_params[:b_account] = BAccount.find(params[:b_account][:id])

#			params[:a_account] ? bpayment_params[:a_account] = AAccount.find(params[:a_account][:id]) : bpayment_params[:a_account] = nil
			bpayment_params[:a_account] = AAccount.find(bpayment_params[:a_account])

			@payment = BPayment.new( bpayment_params ) 
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
		full_payment_params = payment_params

		if params[:apayment]
			@payment = APayment.unscoped.find(params[:apayment][:id]) 
		elsif params[:bpayment]
			@payment = BPayment.unscoped.find(params[:bpayment][:id]) 
		
			full_payment_params[:b_account] = BAccount.find(params[:b_account][:id])
			full_payment_params[:a_account] = AAccount.find(params[:a_account][:id]) if params[:a_account]
			full_payment_params[:resourcer] = Resourcer.find(params[:b_account][:id]) if params[:b_account]

		end

		respond_to do |format|
			if @payment.update_attributes( full_payment_params )
				format.json { head :ok }
			else
				format.json { render json: @payment.errors, status: :unprocessable_entity }
			end
		end
	end

end