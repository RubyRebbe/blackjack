require 'spec_helper'

describe "user_games/edit" do
  before(:each) do
    @user_game = assign(:user_game, stub_model(UserGame,
      :user => nil,
      :game => nil
    ))
  end

  it "renders the edit user_game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => user_games_path(@user_game), :method => "post" do
      assert_select "input#user_game_user", :name => "user_game[user]"
      assert_select "input#user_game_game", :name => "user_game[game]"
    end
  end
end
