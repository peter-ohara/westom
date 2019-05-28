require 'rails_helper'

RSpec.describe "activities/edit", type: :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      :user => nil,
      :deal => nil,
      :title => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit activity form" do
    render

    assert_select "form[action=?][method=?]", activity_path(@activity), "post" do

      assert_select "input[name=?]", "activity[user_id]"

      assert_select "input[name=?]", "activity[deal_id]"

      assert_select "input[name=?]", "activity[title]"

      assert_select "textarea[name=?]", "activity[description]"
    end
  end
end
