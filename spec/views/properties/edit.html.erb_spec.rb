require 'rails_helper'

RSpec.describe "properties/edit", type: :view do
  before(:each) do
    @property = assign(:property, Property.create!(
      :name => "MyString",
      :description => "MyText",
      :location => "MyText",
      :category => 1,
      :property_type => 1,
      :contact => nil
    ))
  end

  it "renders the edit property form" do
    render

    assert_select "form[action=?][method=?]", property_path(@property), "post" do

      assert_select "input[name=?]", "property[name]"

      assert_select "textarea[name=?]", "property[description]"

      assert_select "textarea[name=?]", "property[location]"

      assert_select "input[name=?]", "property[category]"

      assert_select "input[name=?]", "property[property_type]"

      assert_select "input[name=?]", "property[contact_id]"
    end
  end
end
