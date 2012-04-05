require 'spec_helper'

describe "user_games/new" do
  before(:each) do
    assign(:user_game, stub_model(UserGame,
      :user => nil,
      :game => nil
    ).as_new_record)
  end

  it "renders new user_game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_games_path, :method => "post" do
      assert_select "input#user_game_user", :name => "user_game[user]"
      assert_select "input#user_game_game", :name => "user_game[game]"
    end
  end
end
