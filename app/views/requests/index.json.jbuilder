json.array! @requests_and_project  do |request|
	json.id request.id
	json.date request.date.strftime('%d.%m.%Y')
	json.project_name request.project.name
	json.sum request.sum
	json.is_approved request.is_approved
	json.created_at request.created_at.strftime('%d.%m.%Y %H:%M:%S')
	json.updated_at request.updated_at.strftime('%d.%m.%Y %H:%M:%S')
	json.b_payments request.b_payments do |b_payment|
		json.id b_payment.id
		json.b_acc_number b_payment.b_account.number
		json.b_acc_name b_payment.b_account.name
    json.sum_allowed b_payment.sum_allowed
    json.sum_rest b_payment.sum_rest
    json.recipient b_payment.recipient
    json.detail b_payment.detail
    json.note b_payment.note
		json.sum b_payment.sum
	end
	json.is_visible false
end