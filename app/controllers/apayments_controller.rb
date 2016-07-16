class ApaymentsController < ApplicationController
  def update
		@apayment = APayment.find(params[:apayment][:id])
		respond_to do |format|
			if @apayment.update_attributes( params[:apayment] )
				format.json { head :no_content }
			else
				format.json { render json: @apayment.errors, status: :unprocessable_entity }
			end
		end
  end

  def apayment_params
    params.require(:apayment).permit(:detail, :id, :is_changed, :payer, :payer_account, :payer_mfo, :recipient, :recipient_account, :recipient_bank, :recipient_egrpou, :recipient_mfo, :sum)
  end
  
end