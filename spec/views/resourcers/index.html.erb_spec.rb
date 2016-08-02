require 'rails_helper'

RSpec.describe "resourcers/index", type: :view do
  before(:each) do
    assign(:resourcers, [
      Resourcer.create!(
        :name => "Name"
      ),
      Resourcer.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of resourcers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
