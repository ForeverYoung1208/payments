require 'rails_helper'

RSpec.describe "BAccounts", type: :request do
  describe "GET /b_accounts" do
    it "works! (now write some real specs)" do
      get b_accounts_path
      expect(response).to have_http_status(200)
    end
  end
end
