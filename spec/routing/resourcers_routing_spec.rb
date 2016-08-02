require "rails_helper"

RSpec.describe ResourcersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/resourcers").to route_to("resourcers#index")
    end

    it "routes to #new" do
      expect(:get => "/resourcers/new").to route_to("resourcers#new")
    end

    it "routes to #show" do
      expect(:get => "/resourcers/1").to route_to("resourcers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/resourcers/1/edit").to route_to("resourcers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/resourcers").to route_to("resourcers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/resourcers/1").to route_to("resourcers#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/resourcers/1").to route_to("resourcers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/resourcers/1").to route_to("resourcers#destroy", :id => "1")
    end

  end
end
