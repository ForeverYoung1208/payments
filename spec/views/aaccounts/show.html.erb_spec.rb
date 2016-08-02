require 'rails_helper'

RSpec.describe "aaccounts/show", type: :view do
  before(:each) do
    @aaccount = assign(:aaccount, Aaccount.create!(
      :number => "Number",
      :company_name => "Company Name",
      :code => "Code"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Code/)
  end
end
