require 'rails_helper'

RSpec.describe Request, type: :model do
	before :each do
		@request=FactoryGirl.create(:request) 
	end

	it "test1" do
		expect(@request.project.name).to_not be_nil
	end

  pending "add some examples to (or delete) #{__FILE__}"

end
