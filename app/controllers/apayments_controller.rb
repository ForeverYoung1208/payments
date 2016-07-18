class ApaymentsController < ApplicationController
 include SavePayments

  def payment_params
    params.require(:apayment).permit(:detail, :id, :payer, :payer_account, :payer_mfo, :recipient, :recipient_account, :recipient_bank, :recipient_egrpou, :recipient_mfo, :sum)
  end
  
end