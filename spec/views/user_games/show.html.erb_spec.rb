require 'spec_helper'

describe "user_games/show" do
  before(:each) do
    @user_game = assign(:user_game, stub_model(UserGame,
      :user => nil,
      :game => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
