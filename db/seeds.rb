Country.destroy_all
User.destroy_all
admin = User.new(email: 'admin@test.com', password: 'admin@test.com')
admin.save!

CS.countries.to_h.each do |key, country|
  country = Country.new(name: country, user_id: admin.id)
  country.save!
end

puts " done!"
