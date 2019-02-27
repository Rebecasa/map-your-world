Country.destroy_all
User.destroy_all
admin = User.new(email: 'admin@test.com', password: 'admin@test.com')
admin.save!

CS.countries.to_h.each do |key, country|
  country = Country.new(name: country, user_id: admin.id)
  if country.name == "Myanmar [Burma]"
    country.name = "Myanmar"
   end
  unless Geocoder.search(country.name).empty?
    country.latitude = Geocoder.search(country.name).first.coordinates[0]
    country.longitude = Geocoder.search(country.name).first.coordinates[1]
   end
  country.save!
end

puts "done!"

