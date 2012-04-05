class Credential < ActiveRecord::Base 
  belongs_to :user

	validates :name, :exclusion => { 
		:in => [ "dealer"],
		:message => "any user name but dealer" 
	}
end
