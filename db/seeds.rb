require 'faker'

# Declaring Variables

cover_array = []
avatar_array = []
avatar_counter = 0

puts 'Welcome! This seed file will add some users to the site please hold still!'

puts 'Clearing data....'
User.destroy_all
puts "data cleared.."
puts 'Creating users...'


35.times do
User.create!(
  email: Faker::Internet.unique.email,
  username: Faker::Name.unique.middle_name,
  password: 'secret',
  bio: Faker::Quote.matz,
  )
end

puts "Users created ✅"
puts "Adding other data to users...."


Dir.foreach('./storage/cover_images') do |image|
  next if image == '.' or image == '..' or image == '.DS_Store'
  cover_array << image
end

Dir.foreach('./storage/profile_pics') do |image|
  next if image == '.' or image == '..' or image == '.DS_Store'
  avatar_array << image
end

User.all.each do |user|
  # Saving user covers randomly
  user.cover = Pathname.new(Rails.root.join("./storage/cover_images/#{cover_array.sample}")).open
  user.save
  # Ordering the Avatar array
  sorted_avatars = avatar_array.sort_by(&:to_i)
  # Saving the profile pictures
  user.avatar = Pathname.new(Rails.root.join("./storage/profile_pics/#{sorted_avatars[avatar_counter]}")).open
  user.save
  avatar_counter += 1
  puts "Images injected #{avatar_counter}"
end

puts "All user covers and avatars have been added! ✅"
puts "Adding some posts....."

30.times do
  user = User.all.sample
  user.miniposts.create!(
    content: Faker::Hacker.say_something_smart
    )
end

puts "Adding posts with images...."

7.times do
  user = User.all.sample
  user.miniposts.create!(
    content: Faker::GreekPhilosophers.unique.quote,
    picture: Pathname.new(Rails.root.join("./storage/cover_images/#{cover_array.sample}")).open
    )
end

puts "Finished adding data."
puts "Done! ✅"
