require 'rails_helper'

RSpec.describe "b_accounts/edit", type: :view do
  before(:each) do
    @b_account = assign(:b_account, BAccount.create!(
      :number => "MyString",
      :name => "MyString",
      :plan => "9.99",
      :fact => "9.99"
    ))
  end

  it "renders the edit b_account form" do
    render

    assert_select "form[action=?][method=?]", b_account_path(@b_account), "post" do

      assert_select "input#b_account_number[name=?]", "b_account[number]"

      assert_select "input#b_account_name[name=?]", "b_account[name]"

      assert_select "input#b_account_plan[name=?]", "b_account[plan]"

      assert_select "input#b_account_fact[name=?]", "b_account[fact]"
    end
  end
end
