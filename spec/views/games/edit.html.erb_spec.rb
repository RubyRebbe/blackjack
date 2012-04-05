require 'spec_helper'

describe "games/edit" do
  before(:each) do
    @game = assign(:game, stub_model(Game,
      :win => false,
      :lose => false,
      :tie => false
    ))
  end

  it "renders the edit game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => games_path(@game), :method => "post" do
      assert_select "input#game_win", :name => "game[win]"
      assert_select "input#game_lose", :name => "game[lose]"
      assert_select "input#game_tie", :name => "game[tie]"
    end
  end
end
