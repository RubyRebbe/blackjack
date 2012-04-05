require "spec_helper"

describe UserGamesController do
  describe "routing" do

    it "routes to #index" do
      get("/user_games").should route_to("user_games#index")
    end

    it "routes to #new" do
      get("/user_games/new").should route_to("user_games#new")
    end

    it "routes to #show" do
      get("/user_games/1").should route_to("user_games#show", :id => "1")
    end

    it "routes to #edit" do
      get("/user_games/1/edit").should route_to("user_games#edit", :id => "1")
    end

    it "routes to #create" do
      post("/user_games").should route_to("user_games#create")
    end

    it "routes to #update" do
      put("/user_games/1").should route_to("user_games#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/user_games/1").should route_to("user_games#destroy", :id => "1")
    end

  end
end
