require 'rails_helper'

RSpec.describe "resourcers/edit", type: :view do
  before(:each) do
    @resourcer = assign(:resourcer, Resourcer.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit resourcer form" do
    render

    assert_select "form[action=?][method=?]", resourcer_path(@resourcer), "post" do

      assert_select "input#resourcer_name[name=?]", "resourcer[name]"
    end
  end
end
