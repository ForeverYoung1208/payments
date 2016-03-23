FactoryGirl.define do
	factory :a_payment do

		payer "Платник"
		payer_account 260012121212121
		payer_mfo "305299"
		recipient "Отримувач"
		detail "Призначення платежу"
		pecipient_account 260078121212112
		recipient_bank "Укабанк"
		recipient_mfo "206300"
		recipient_egrpou "12345678"
		sum 70.00 

		association :request, factory: :request

		created_at Time.now-1.hour
		updated_at Time.now

	end
end