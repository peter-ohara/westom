require 'rails_helper'

RSpec.describe "contacts/show", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :full_name => "Full Name",
      :present_address => "MyText",
      :community => "Community",
      :length_of_stay_at_present_address => 2,
      :mobile => "Mobile",
      :occupation => "Occupation",
      :email => "Email",
      :personal_property => false,
      :jointly_owned_property => false,
      :agent => false,
      :has_authority_from_owner => false,
      :has_site_plan => false,
      :site_plan_request => false,
      :search_report => false,
      :search_report_request => false,
      :valuation_report => false,
      :valuation_report_request => false,
      :type_of_service => 3,
      :request_details => "MyText",
      :client_signature => "Client Signature",
      :user => nil,
      :signature_of_authorized_broker => "Signature Of Authorized Broker"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Community/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Occupation/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Client Signature/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Signature Of Authorized Broker/)
  end
end
