require 'rails_helper'

RSpec.describe "contacts/edit", type: :view do
  before(:each) do
    @contact = assign(:contact, Contact.create!(
      :full_name => "MyString",
      :present_address => "MyText",
      :community => "MyString",
      :length_of_stay_at_present_address => 1,
      :mobile => "MyString",
      :occupation => "MyString",
      :email => "MyString",
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
      :type_of_service => 1,
      :request_details => "MyText",
      :client_signature => "MyString",
      :user => nil,
      :signature_of_authorized_broker => "MyString"
    ))
  end

  it "renders the edit contact form" do
    render

    assert_select "form[action=?][method=?]", contact_path(@contact), "post" do

      assert_select "input[name=?]", "contact[full_name]"

      assert_select "textarea[name=?]", "contact[present_address]"

      assert_select "input[name=?]", "contact[community]"

      assert_select "input[name=?]", "contact[length_of_stay_at_present_address]"

      assert_select "input[name=?]", "contact[mobile]"

      assert_select "input[name=?]", "contact[occupation]"

      assert_select "input[name=?]", "contact[email]"

      assert_select "input[name=?]", "contact[personal_property]"

      assert_select "input[name=?]", "contact[jointly_owned_property]"

      assert_select "input[name=?]", "contact[agent]"

      assert_select "input[name=?]", "contact[has_authority_from_owner]"

      assert_select "input[name=?]", "contact[has_site_plan]"

      assert_select "input[name=?]", "contact[site_plan_request]"

      assert_select "input[name=?]", "contact[search_report]"

      assert_select "input[name=?]", "contact[search_report_request]"

      assert_select "input[name=?]", "contact[valuation_report]"

      assert_select "input[name=?]", "contact[valuation_report_request]"

      assert_select "input[name=?]", "contact[type_of_service]"

      assert_select "textarea[name=?]", "contact[request_details]"

      assert_select "input[name=?]", "contact[client_signature]"

      assert_select "input[name=?]", "contact[user_id]"

      assert_select "input[name=?]", "contact[signature_of_authorized_broker]"
    end
  end
end
