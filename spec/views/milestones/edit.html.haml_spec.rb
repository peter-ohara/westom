require 'rails_helper'

RSpec.describe "milestones/edit", type: :view do
  before(:each) do
    @milestone = assign(:milestone, Milestone.create!(
      :title => "MyString",
      :description => "MyText",
      :target_type => 1,
      :target => "9.99",
      :department => 1,
      :status => 1
    ))
  end

  it "renders the edit milestone form" do
    render

    assert_select "form[action=?][method=?]", milestone_path(@milestone), "post" do

      assert_select "input[name=?]", "milestone[title]"

      assert_select "textarea[name=?]", "milestone[description]"

      assert_select "input[name=?]", "milestone[target_type]"

      assert_select "input[name=?]", "milestone[target]"

      assert_select "input[name=?]", "milestone[department]"

      assert_select "input[name=?]", "milestone[status]"
    end
  end
end
