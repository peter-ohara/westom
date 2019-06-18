require 'rails_helper'

RSpec.describe "properties/new", type: :view do
  before(:each) do
    assign(:property, Property.new(
      :name => "MyString",
      :description => "MyText",
      :location => "MyText",
      :purpose => 1,
      :property_type => 1,
      :contact => nil
    ))
  end

  it "renders new property form" do
    render

    assert_select "form[action=?][method=?]", properties_path, "post" do

      assert_select "input[name=?]", "property[name]"

      assert_select "textarea[name=?]", "property[description]"

      assert_select "textarea[name=?]", "property[location]"

      assert_select "input[name=?]", "property[purpose]"

      assert_select "input[name=?]", "property[property_type]"

      assert_select "input[name=?]", "property[contact_id]"
    end
  end
end
