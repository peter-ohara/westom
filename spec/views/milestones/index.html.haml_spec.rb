require 'rails_helper'

RSpec.describe "milestones/index", type: :view do
  before(:each) do
    assign(:milestones, [
      Milestone.create!(
        :title => "Title",
        :description => "MyText",
        :target_type => 2,
        :target => "9.99",
        :department => 3,
        :status => 4
      ),
      Milestone.create!(
        :title => "Title",
        :description => "MyText",
        :target_type => 2,
        :target => "9.99",
        :department => 3,
        :status => 4
      )
    ])
  end

  it "renders a list of milestones" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
