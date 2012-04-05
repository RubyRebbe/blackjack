#!/usr/bin/ruby
system( "rails new blackjack --database sqlite3")
Dir.chdir "blackjack"
def update_gemfile
	gemfile = "Gemfile"
	file_contents = File.open( gemfile) { |f| f.read }
	file_contents = file_contents + "gem 'simple_form'
gem 'rspec-rails'
gem 'factory_girl_rails'
"
	File.open( gemfile, "w") { |f| f.write( file_contents) }
end
update_gemfile
system "bundle install"
system "rails generate simple_form:install"
system "rails generate rspec:install"
system( "rails generate scaffold Credential name:string password:string user:references")
# generate model class Credential
f = File.new( "app/models/credential.rb", "w")
f.write <<-EOKLASS
class Credential < ActiveRecord::Base 
  belongs_to :user 
end
EOKLASS
f.close


system( "rails generate scaffold User name:string password:string ")
# generate model class User
f = File.new( "app/models/user.rb", "w")
f.write <<-EOKLASS
class User < ActiveRecord::Base 
  has_many :credentials
  has_many :user_games
  has_many :games, :through => :user_games
   
end
EOKLASS
f.close


system( "rails generate scaffold Game win:boolean lose:boolean tie:boolean ")
# generate model class Game
f = File.new( "app/models/game.rb", "w")
f.write <<-EOKLASS
class Game < ActiveRecord::Base 
  has_many :user_games
  has_many :users, :through => :user_games 
end
EOKLASS
f.close


system( "rails generate scaffold Card rank:string suit:string user_game:references")
# generate model class Card
f = File.new( "app/models/card.rb", "w")
f.write <<-EOKLASS
class Card < ActiveRecord::Base 
  belongs_to :user_game 
end
EOKLASS
f.close


system( "rails generate scaffold UserGame user:references game:references ")
# generate model class UserGame
f = File.new( "app/models/user_game.rb", "w")
f.write <<-EOKLASS
class UserGame < ActiveRecord::Base 
  belongs_to :user
  belongs_to :game 
end
EOKLASS
f.close


system "rake db:create"
system "rake db:migrate"