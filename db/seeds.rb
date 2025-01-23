require 'factory_bot_rails'
include FactoryBot::Syntax::Methods
Artist.delete_all
Stage.delete_all
Show.delete_all
User.delete_all
UserShow.delete_all

puts 'Creating users...'
users = create_list(:user, 12)

puts 'Creating artists and stages...'
artists = create_list(:artist, 20) 
stages = create_list(:stage, 3)

puts 'Creating shows...'
shows = create_list(:show, 15) do |show|
  show.artist = artists.sample
  show.stage = stages.sample
end


puts 'Assigning shows to users...'
users.each do |user|
  selected_shows = shows.sample(5)
  selected_shows.each do |show|
    create(:user_show, user: user, show: show)
  end
end

puts 'Seeding completed!'
