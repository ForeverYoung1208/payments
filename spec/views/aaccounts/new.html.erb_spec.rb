require 'rails_helper'

RSpec.describe "aaccounts/new", type: :view do
  before(:each) do
    assign(:aaccount, Aaccount.new(
      :number => "MyString",
      :company_name => "MyString",
      :code => "MyString"
    ))
  end

  it "renders new aaccount form" do
    render

    assert_select "form[action=?][method=?]", aaccounts_path, "post" do

      assert_select "input#aaccount_number[name=?]", "aaccount[number]"

      assert_select "input#aaccount_company_name[name=?]", "aaccount[company_name]"

      assert_select "input#aaccount_code[name=?]", "aaccount[code]"
    end
  end
end
