module SavePayments
  extend ActiveSupport::Concern
  
  def update
  	@payment = APayment.find(params[:apayment][:id]) if params[:apayment]
  	@payment = BPayment.find(params[:bpayment][:id]) if params[:bpayment]

		respond_to do |format|
			if @payment.update_attributes( payment_params )
				format.json { head :ok }
			else
				format.json { render json: @payment.errors, status: :unprocessable_entity }
			end
		end
  end

end