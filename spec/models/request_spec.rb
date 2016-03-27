require 'rails_helper'

RSpec.describe Request, type: :model do
	before :each do
		@request = FactoryGirl.create(:request) 
		FactoryGirl.create(:a_payment, {request: @request, sum: 10}) 
		FactoryGirl.create(:a_payment, {request: @request, sum: 60}) 
		FactoryGirl.create(:b_payment, {request: @request, sum: 30}) 
		FactoryGirl.create(:b_payment, {request: @request, sum: 40}) 

	end

	it "test_begin: project name have to be not nil" do
		expect(@request.project.name).to_not be_nil
	end

	it "sum of request should be 70" do
		expect(@request.sum).to eq(70)
	end

	it "sum of request with bad payments should give error" do
		@request.a_payments[0].sum = 71
		@request.a_payments[0].save
		expect { @request.sum }.to raise_error( Request::SumError )

	end



end
