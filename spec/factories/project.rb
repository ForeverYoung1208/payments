FactoryGirl.define do
	factory :project do
		sequence(:name) { |n| "Проект#{n}" }
	end
end