User.create!(name:  "Dat Pham", email: "phamtatdat2212@gmail.com",
  password: "12345678", password_confirmation: "12345678", admin: true,
    activated: true, activated_at: Time.zone.now)

User.create!(name:  "abc", email: "abc@gmail.com",
  password: "12345678", password_confirmation: "12345678",
    activated: true, activated_at: Time.zone.now)

9.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name, email: email, password: password,
    password_confirmation: password)
end

users = User.order(:created_at).take(6)
5.times do
  content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
end
