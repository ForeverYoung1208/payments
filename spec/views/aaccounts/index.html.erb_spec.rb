require 'rails_helper'

RSpec.describe "aaccounts/index", type: :view do
  before(:each) do
    assign(:aaccounts, [
      Aaccount.create!(
        :number => "Number",
        :company_name => "Company Name",
        :code => "Code"
      ),
      Aaccount.create!(
        :number => "Number",
        :company_name => "Company Name",
        :code => "Code"
      )
    ])
  end

  it "renders a list of aaccounts" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
  end
end
