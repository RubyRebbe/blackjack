require "spec_helper"

describe CredentialsController do
  describe "routing" do

    it "routes to #index" do
      get("/credentials").should route_to("credentials#index")
    end

    it "routes to #new" do
      get("/credentials/new").should route_to("credentials#new")
    end

    it "routes to #show" do
      get("/credentials/1").should route_to("credentials#show", :id => "1")
    end

    it "routes to #edit" do
      get("/credentials/1/edit").should route_to("credentials#edit", :id => "1")
    end

    it "routes to #create" do
      post("/credentials").should route_to("credentials#create")
    end

    it "routes to #update" do
      put("/credentials/1").should route_to("credentials#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/credentials/1").should route_to("credentials#destroy", :id => "1")
    end

  end
end
