FactoryGirl.define do
	factory :b_payment do
#		b_account_id
		association :b_account, factory: :b_account

		sum_allowed 1333
		sum_rest 1222
		sum 70.00
		recipient "ТОВ Отримувач"
		detail "Призначення платежу"
		note "Примітки до платежу"

#		request_id
		association :request, factory: :request

		created_at Time.now-1.hour
		updated_at Time.now
	end
end