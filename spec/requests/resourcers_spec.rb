require 'rails_helper'

RSpec.describe "Resourcers", type: :request do
  describe "GET /resourcers" do
    it "works! (now write some real specs)" do
      get resourcers_path
      expect(response).to have_http_status(200)
    end
  end
end
