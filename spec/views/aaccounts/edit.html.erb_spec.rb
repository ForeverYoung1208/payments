require 'rails_helper'

RSpec.describe "aaccounts/edit", type: :view do
  before(:each) do
    @aaccount = assign(:aaccount, Aaccount.create!(
      :number => "MyString",
      :company_name => "MyString",
      :code => "MyString"
    ))
  end

  it "renders the edit aaccount form" do
    render

    assert_select "form[action=?][method=?]", aaccount_path(@aaccount), "post" do

      assert_select "input#aaccount_number[name=?]", "aaccount[number]"

      assert_select "input#aaccount_company_name[name=?]", "aaccount[company_name]"

      assert_select "input#aaccount_code[name=?]", "aaccount[code]"
    end
  end
end
