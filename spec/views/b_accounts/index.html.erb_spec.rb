require 'rails_helper'

RSpec.describe "b_accounts/index", type: :view do
  before(:each) do
    assign(:b_accounts, [
      BAccount.create!(
        :number => "Number",
        :name => "Name",
        :plan => "9.99",
        :fact => "9.99"
      ),
      BAccount.create!(
        :number => "Number",
        :name => "Name",
        :plan => "9.99",
        :fact => "9.99"
      )
    ])
  end

  it "renders a list of b_accounts" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
