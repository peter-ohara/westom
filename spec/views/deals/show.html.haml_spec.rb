require 'rails_helper'

RSpec.describe "deals/show", type: :view do
  before(:each) do
    @deal = assign(:deal, Deal.create!(
      :contact => nil,
      :property => nil,
      :type_of_service => 2,
      :request_details => "MyText",
      :amount_cents => 3,
      :stage => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
