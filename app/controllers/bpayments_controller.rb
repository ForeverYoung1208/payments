class BpaymentsController < ApplicationController
 include SavePayments


  def payment_params
  	params.require(:bpayment).permit(:sum_allowed, :sum_rest, :sum, :recipient, :detail, :note, :is_deleted, :b_account )
  end
  
end