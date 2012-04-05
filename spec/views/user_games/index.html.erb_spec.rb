require 'spec_helper'

describe "user_games/index" do
  before(:each) do
    assign(:user_games, [
      stub_model(UserGame,
        :user => nil,
        :game => nil
      ),
      stub_model(UserGame,
        :user => nil,
        :game => nil
      )
    ])
  end

  it "renders a list of user_games" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
