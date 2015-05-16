json.array!(@companies) do |company|
  json.extract! company, :id, :name, :address1, :address2, :city, :state, :zip, :contact_name, :string, :contact_phone, :contact_email
  json.url company_url(company, format: :json)
end
