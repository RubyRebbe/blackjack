require 'spec_helper'

describe Game do
	before :all do
		[ User, Game, UserGame ].each { |k| k.destroy_all }
		@game = Game.create
	end

	it "on creation, the dealer is a player in the game" do
		@game.users.count.should be 1
		@game.users.first.name.should == "dealer"
	end

	it "can associate a player with a game, in addition to the dealer" do
		game = Game.create()
		game.users.create( :name => "bob")
		game.users.count.should be 2
		game.users.map { |u| u.name }.sort.should == [ "bob", "dealer" ]
	end

	it "can find the dealer's hand for this game" do
		game = Game.create()
		game.user_games.where( :user_id => User.dealer.id).count.should be 1
		game.dealer_hand.user.id.should be User.dealer.id
		game.dealer_hand.game.id.should be game.id
	end

	it "can add an ace card into the dealer's hand" do
		game = Game.create()
		game.dealer_hand.cards.count.should be 2
		game.dealer_hand.cards.create( :rank => "ace")
		game.dealer_hand.cards.count.should be 3
		game.dealer_hand.cards.map { |c| c.rank }.should include "ace"
	end

	it "can add a randomly generated card to the dealer's hand" do
		game = Game.create()
		hand = game.dealer_hand
		hand.cards << Card.hit
		# cannot think of a better way to test randomly generated rank
		puts "card rank: #{hand.cards.first.rank}"
	end

	it "bob can ask for a hit" do
		game = Game.create()
		bob = game.users.create( :name => "bob")
		bob.name.should == "bob"
		hand = bob.hand(game)
		hand.cards.count.should be 2
		bob.hit_me(game)
		hand.cards.count.should be 3
		puts "card rank: #{bob.hand(game).cards.first.rank}" 
	end
end
