json.array!(@charges) do |charge|
  json.extract! charge, :created, :paid, :amount, :currency, :refunded, :customer_id
  json.url charge_url(charge, format: :json)
end