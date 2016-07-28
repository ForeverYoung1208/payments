json.array! @requests_and_project  do |request|
	json.id request.id
	json.date request.date.strftime('%d.%m.%Y')
	json.project request.project
	json.sum request.sum
	json.is_approved request.is_approved
	json.created_at request.created_at.strftime('%d.%m.%Y %H:%M:%S')
	json.updated_at request.updated_at.strftime('%d.%m.%Y %H:%M:%S')
	json.b_payments request.b_payments do |b_payment|
		json.id b_payment.id
		json.b_account b_payment.b_account
    json.sum_allowed b_payment.sum_allowed
    json.sum_rest b_payment.sum_rest
    json.recipient b_payment.recipient
    json.detail b_payment.detail
    json.note b_payment.note
		json.sum b_payment.sum
	end
	json.a_payments request.a_payments do |a_payment|
		json.id a_payment.id
		json.payer a_payment.payer 
		json.payer_account a_payment.payer_account
		json.payer_mfo a_payment.payer_mfo
		json.recipient a_payment.recipient
		json.detail a_payment.detail
		json.recipient_account a_payment.recipient_account
		json.recipient_bank a_payment.recipient_bank
		json.recipient_mfo a_payment.recipient_mfo
		json.recipient_egrpou a_payment.recipient_egrpou
		json.sum a_payment.sum
	end
	json.is_visible false
	json.is_bpayments_visible true
end