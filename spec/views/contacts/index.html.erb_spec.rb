require 'rails_helper'

RSpec.describe "contacts/index", type: :view do
  before(:each) do
    assign(:contacts, [
      Contact.create!(
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
      ),
      Contact.create!(
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
      )
    ])
  end

  it "renders a list of contacts" do
    render
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Community".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Occupation".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Client Signature".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Signature Of Authorized Broker".to_s, :count => 2
  end
end
