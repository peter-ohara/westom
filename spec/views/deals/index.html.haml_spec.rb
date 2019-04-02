require 'rails_helper'

RSpec.describe "deals/index", type: :view do
  before(:each) do
    assign(:deals, [
      Deal.create!(
        :contact => nil,
        :property => nil,
        :type_of_service => 2,
        :request_details => "MyText",
        :amount_cents => 3,
        :stage => 4
      ),
      Deal.create!(
        :contact => nil,
        :property => nil,
        :type_of_service => 2,
        :request_details => "MyText",
        :amount_cents => 3,
        :stage => 4
      )
    ])
  end

  it "renders a list of deals" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
