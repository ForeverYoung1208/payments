require 'rails_helper'

RSpec.describe Request, type: :model do
	before :each do
		@request = FactoryGirl.create(:request) 
		@b_payment = FactoryGirl.create(:b_payment, {request: @request, sum: 30}) 
		@b_payment = FactoryGirl.create(:b_payment, {request: @request, sum: 40}) 
		@a_payment = FactoryGirl.create(:a_payment, {request: @request, sum: 70}) 

	end

	it "test_begin: project name have to be not nil" do
		expect(@request.project.name).to_not be_nil
	end

	it "sum of request should be 70" do
		expect(@request.sum).to eq(70)
	end

	it "sum of request should give error" do
		@a_payment.sum = 71
		expect { @request.sum }.to raise_error
	end



end
