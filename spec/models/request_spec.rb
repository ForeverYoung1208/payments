require 'rails_helper'

RSpec.describe Request, type: :model do
	before :each do
		@request = FactoryGirl.create(:request) 
		@b_payment = FactoryGirl.create(:b_payment, {request: @request}) 
	end

	it "test_begin, project name have to be not nil" do
		expect(@request.project.name).to_not be_nil
	end

	it "test_begin, project name have to be not nil" do
		expect(@request.project.name).to_not be_nil
	end


  pending "add some examples to (or delete) #{__FILE__}"

end
