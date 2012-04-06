class Card < ActiveRecord::Base 
  belongs_to :user_game

	@@numbers = (2..10).to_a.map { |i| i.to_s }
	@@royalty = [ "jack", "queen", "king" ]
	@@ranks = [ "ace" ] + @@numbers + @@royalty

	# legal values for the rank attribute
	def self.ranks
		@@ranks
	end

	# evaluator. works correctly for all but aces
	# pending:  ace defaults to 1. When is it 11?
	def self.values
		Hash[
			[[ "ace", 1 ]] + 
			@@numbers.map { |si| [ si, si.to_i ] } + 
			@@royalty.map { |royal| [ royal, 10 ] }
		]
	end

	def self.hit # simulates getting a random card from the deck
		# generate a random number between 0 and 12
		# use it to index into the collection of all ranks
		# return a card with that rank
		self.create( :rank => self.ranks[ rand( 12)])
	end

	# value of this card. for the ace, depends on whose hand it is in:  dealer or player
	def value 
		self.class.values[self.rank]
	end
end
