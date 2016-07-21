require 'rails_helper'

RSpec.describe "b_accounts/show", type: :view do
  before(:each) do
    @b_account = assign(:b_account, BAccount.create!(
      :number => "Number",
      :name => "Name",
      :plan => "9.99",
      :fact => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
  end
end
