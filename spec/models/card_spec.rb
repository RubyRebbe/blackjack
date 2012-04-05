require 'spec_helper'

describe Card do
	before :all do
		Card.destroy_all
		@numbers = (2..10).to_a.map { |i| i.to_s }
		@royalty = [ "jack", "queen", "king" ]
	end

  it "all legal ranks" do
		Card.ranks.should == [ "ace" ] + @numbers + @royalty
		@numbers.each { |i| i.class.should == String }
	end

	it "map of legal values for cards, not taking into account wild aces" do
		Card.values["ace"].should == 1
		@numbers.each { |i| Card.values[i].should == i.to_i }
		@royalty.each { |r| Card.values[r].should == 10 }
	end

	it "can calculate the value of a card, not taking into account wild aces" do
		card_set = Card.ranks.map { |rnk| Card.create( :rank => rnk) }
		card_set.count.should == 13
		card_set.each { |c| c.value.should == Card.values[c.rank] }		
	end

	it "can simulate hit, i.e. receiving a random card" do
		card = Card.hit
		Card.ranks.should include card.rank
	end

	it "can calculate the value of a card, handling aces" do
		pending
	end
end
