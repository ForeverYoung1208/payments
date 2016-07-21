require "rails_helper"

RSpec.describe BAccountsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/b_accounts").to route_to("b_accounts#index")
    end

    it "routes to #new" do
      expect(:get => "/b_accounts/new").to route_to("b_accounts#new")
    end

    it "routes to #show" do
      expect(:get => "/b_accounts/1").to route_to("b_accounts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/b_accounts/1/edit").to route_to("b_accounts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/b_accounts").to route_to("b_accounts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/b_accounts/1").to route_to("b_accounts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/b_accounts/1").to route_to("b_accounts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/b_accounts/1").to route_to("b_accounts#destroy", :id => "1")
    end

  end
end
