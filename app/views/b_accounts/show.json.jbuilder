json.array!(@b_accounts) do |b_account|
  json.extract! b_account, :id, :number, :name, :plan, :fact
  json.url b_account_url(b_account, format: :json)
end


# json.extract! @b_account, :id, :number, :name, :plan, :fact, :created_at, :updated_at
