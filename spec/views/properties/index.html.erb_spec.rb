require 'rails_helper'

RSpec.describe "properties/index", type: :view do
  before(:each) do
    assign(:properties, [
      Property.create!(
        :name => "Name",
        :description => "MyText",
        :location => "MyText",
        :purpose => 2,
        :property_type => 3,
        :contact => nil
      ),
      Property.create!(
        :name => "Name",
        :description => "MyText",
        :location => "MyText",
        :purpose => 2,
        :property_type => 3,
        :contact => nil
      )
    ])
  end

  it "renders a list of properties" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
