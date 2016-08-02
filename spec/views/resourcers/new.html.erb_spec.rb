require 'rails_helper'

RSpec.describe "resourcers/new", type: :view do
  before(:each) do
    assign(:resourcer, Resourcer.new(
      :name => "MyString"
    ))
  end

  it "renders new resourcer form" do
    render

    assert_select "form[action=?][method=?]", resourcers_path, "post" do

      assert_select "input#resourcer_name[name=?]", "resourcer[name]"
    end
  end
end
