json.array!(@profiles) do |profile|
  json.extract! profile, :id, :first_name, :last_name, :bio, :email, :image_url
  json.url profile_url(profile, format: :json)
end
