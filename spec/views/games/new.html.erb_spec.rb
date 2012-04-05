require 'spec_helper'

describe "games/new" do
  before(:each) do
    assign(:game, stub_model(Game,
      :win => false,
      :lose => false,
      :tie => false
    ).as_new_record)
  end

  it "renders new game form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => games_path, :method => "post" do
      assert_select "input#game_win", :name => "game[win]"
      assert_select "input#game_lose", :name => "game[lose]"
      assert_select "input#game_tie", :name => "game[tie]"
    end
  end
end
