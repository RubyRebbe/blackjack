# alias Hand:  joins User and Game and has cards
class UserGame < ActiveRecord::Base 
  belongs_to :user
  belongs_to :game
	has_many	 :cards

	after_create do
	 	cards << Card.hit
		cards << Card.hit
	end

	# default ace value is 1.  When is it 11? Review the rules.
	# depends on who holds the hand:  dealer or player
	def value # value of the hand
		non_aces = cards.find_all { |c| c.rank != "ace" }
		aces = cards.find_all { |c| c.rank == "ace" }
		non_aces_value = non_aces.reduce(0) { |m,c| m + c.value }
		
		retval, boundary = non_aces_value, 21 - non_aces_value
		if !aces.empty? then
			retval += aces.count
			if aces.count <= boundary then
				# assert: 1 to 4 aces. to gain understand, do case analysis on aces.count
				# assert: at most one of the aces can have the value 1
				retval += (11 <= boundary) ? 10 : 0
			end
		end

		retval
	end # method value

	def busted?
		value > 21
	end
end
