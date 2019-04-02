require 'rails_helper'

RSpec.describe "deals/edit", type: :view do
  before(:each) do
    @deal = assign(:deal, Deal.create!(
      :contact => nil,
      :property => nil,
      :type_of_service => 1,
      :request_details => "MyText",
      :amount_cents => 1,
      :stage => 1
    ))
  end

  it "renders the edit deal form" do
    render

    assert_select "form[action=?][method=?]", deal_path(@deal), "post" do

      assert_select "input[name=?]", "deal[contact_id]"

      assert_select "input[name=?]", "deal[property_id]"

      assert_select "input[name=?]", "deal[type_of_service]"

      assert_select "textarea[name=?]", "deal[request_details]"

      assert_select "input[name=?]", "deal[amount_cents]"

      assert_select "input[name=?]", "deal[stage]"
    end
  end
end
