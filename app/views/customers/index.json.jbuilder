json.array!(@customers) do |customer|
  json.extract! customer, :first_name, :last_name
  json.url customer_url(customer, format: :json)
end