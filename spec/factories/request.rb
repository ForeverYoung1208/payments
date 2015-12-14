FactoryGirl.define do
	factory :request do
		date "14.12.2015"
		is_approved true
		association :project, factory: :project
	end
end