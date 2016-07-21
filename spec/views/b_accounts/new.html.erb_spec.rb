require 'rails_helper'

RSpec.describe "b_accounts/new", type: :view do
  before(:each) do
    assign(:b_account, BAccount.new(
      :number => "MyString",
      :name => "MyString",
      :plan => "9.99",
      :fact => "9.99"
    ))
  end

  it "renders new b_account form" do
    render

    assert_select "form[action=?][method=?]", b_accounts_path, "post" do

      assert_select "input#b_account_number[name=?]", "b_account[number]"

      assert_select "input#b_account_name[name=?]", "b_account[name]"

      assert_select "input#b_account_plan[name=?]", "b_account[plan]"

      assert_select "input#b_account_fact[name=?]", "b_account[fact]"
    end
  end
end
