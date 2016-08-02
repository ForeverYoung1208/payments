json.array!(@a_accounts) do |a_account|
  json.extract! a_account, :id, :number, :company_name, :code
  json.url a_account_url(a_account, format: :json)
end
