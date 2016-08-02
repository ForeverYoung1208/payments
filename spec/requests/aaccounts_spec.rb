require 'rails_helper'

RSpec.describe "Aaccounts", type: :request do
  describe "GET /aaccounts" do
    it "works! (now write some real specs)" do
      get aaccounts_path
      expect(response).to have_http_status(200)
    end
  end
end
