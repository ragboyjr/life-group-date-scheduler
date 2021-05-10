require 'rails_helper'

RSpec.describe "members/index", type: :view do
  before(:each) do
    assign(:members, [
      Member.create!(
        name: "Name"
      ),
      Member.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of members" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
