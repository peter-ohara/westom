require 'rails_helper'

RSpec.describe "activities/new", type: :view do
  before(:each) do
    assign(:activity, Activity.new(
      :user => nil,
      :deal => nil,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new activity form" do
    render

    assert_select "form[action=?][method=?]", activities_path, "post" do

      assert_select "input[name=?]", "activity[user_id]"

      assert_select "input[name=?]", "activity[deal_id]"

      assert_select "input[name=?]", "activity[title]"

      assert_select "textarea[name=?]", "activity[description]"
    end
  end
end
