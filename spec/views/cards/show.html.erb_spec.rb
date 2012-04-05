require 'spec_helper'

describe "cards/show" do
  before(:each) do
    @card = assign(:card, stub_model(Card,
      :rank => "Rank",
      :suit => "Suit",
      :user_game => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Rank/)
    rendered.should match(/Suit/)
    rendered.should match(//)
  end
end
