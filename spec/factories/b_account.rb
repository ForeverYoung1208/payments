FactoryGirl.define do
	factory :b_account do	
		number "1.1.1"
		name "Видатки на нотаріуса"
		plan 555.55
		fact 100
		created_at Time.now-1.hour
		updated_at Time.now
	end	
end