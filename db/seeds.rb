require 'faker'

users = User.order(:created_at).take(3)
50.times do
  content = Faker::Lorem.sentence
  users.each { |user| user.miniposts.create!(content: content) }
end
