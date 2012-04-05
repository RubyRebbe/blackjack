require 'spec_helper'

describe "cards/index" do
  before(:each) do
    assign(:cards, [
      stub_model(Card,
        :rank => "Rank",
        :suit => "Suit",
        :user_game => nil
      ),
      stub_model(Card,
        :rank => "Rank",
        :suit => "Suit",
        :user_game => nil
      )
    ])
  end

  it "renders a list of cards" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Rank".to_s, :count => 2
    assert_select "tr>td", :text => "Suit".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
