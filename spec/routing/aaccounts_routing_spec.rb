require "rails_helper"

RSpec.describe AaccountsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/aaccounts").to route_to("aaccounts#index")
    end

    it "routes to #new" do
      expect(:get => "/aaccounts/new").to route_to("aaccounts#new")
    end

    it "routes to #show" do
      expect(:get => "/aaccounts/1").to route_to("aaccounts#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/aaccounts/1/edit").to route_to("aaccounts#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/aaccounts").to route_to("aaccounts#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/aaccounts/1").to route_to("aaccounts#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/aaccounts/1").to route_to("aaccounts#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/aaccounts/1").to route_to("aaccounts#destroy", :id => "1")
    end

  end
end
