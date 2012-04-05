require 'spec_helper'

describe "cards/edit" do
  before(:each) do
    @card = assign(:card, stub_model(Card,
      :rank => "MyString",
      :suit => "MyString",
      :user_game => nil
    ))
  end

  it "renders the edit card form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => cards_path(@card), :method => "post" do
      assert_select "input#card_rank", :name => "card[rank]"
      assert_select "input#card_suit", :name => "card[suit]"
      assert_select "input#card_user_game", :name => "card[user_game]"
    end
  end
end
