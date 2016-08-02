require 'rails_helper'

RSpec.describe "resourcers/show", type: :view do
  before(:each) do
    @resourcer = assign(:resourcer, Resourcer.create!(
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
