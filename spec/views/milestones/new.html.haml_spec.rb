require 'rails_helper'

RSpec.describe "milestones/new", type: :view do
  before(:each) do
    assign(:milestone, Milestone.new(
      :title => "MyString",
      :description => "MyText",
      :target_type => 1,
      :target => "9.99",
      :status => 1
    ))
  end

  it "renders new milestone form" do
    render

    assert_select "form[action=?][method=?]", milestones_path, "post" do

      assert_select "input[name=?]", "milestone[title]"

      assert_select "textarea[name=?]", "milestone[description]"

      assert_select "input[name=?]", "milestone[target_type]"

      assert_select "input[name=?]", "milestone[target]"

      assert_select "input[name=?]", "milestone[status]"
    end
  end
end
