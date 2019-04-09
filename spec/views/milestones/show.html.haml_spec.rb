require 'rails_helper'

RSpec.describe "milestones/show", type: :view do
  before(:each) do
    @milestone = assign(:milestone, Milestone.create!(
      :title => "Title",
      :description => "MyText",
      :target_type => 2,
      :target => "9.99",
      :department => 3,
      :status => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
