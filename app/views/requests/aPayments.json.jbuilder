json.a_payments @request.a_payments do |a_payment|
	json.id a_payment.id
	json.payer a_payment.payer 
	json.payer_account a_payment.payer_account
	json.payer_mfo a_payment.payer_mfo
	json.recipient a_payment.recipient
	json.detail a_payment.detail
	json.recipient_account a_payment.pecipient_account
	json.recipient_bank a_payment.recipient_bank
	json.recipient_mfo a_payment.recipient_mfo
	json.recipient_egrpou a_payment.recipient_egrpou
	json.sum a_payment.sum
end
