require "csv"

require "faker"

RegionSale.delete_all
GamePlatform.delete_all
GamePublisher.delete_all
Game.delete_all
Region.delete_all
Genre.delete_all
Publisher.delete_all
Platform.delete_all

filename = Rails.root.join("db/dataminer.csv")
csv_data = File.read(filename)
video_games = CSV.parse(csv_data, headers: true, encoding: "utf-8")

filename = Rails.root.join("db/sales.csv")
csv_data = File.read(filename)
sales_num = CSV.parse(csv_data, headers: true, encoding: "utf-8")

video_games.each.with_index do |vg, i|
  genre = Genre.find_or_create_by(genre_name: vg["genre"])

  puts genre.inspect

  game = genre.games.create(
    game_name: vg["title"],
    game_dev:  vg["developers"],
    genre_id:  genre.id
  )
  puts game.inspect
  # game.save!

  game_pub_id = game.game_publishers.create(
    publisher_id: Publisher.find_or_create_by(pub_name: vg["publishers"]).id,
    game_id:      game.id
  )
  puts game_pub_id.inspect
  # game_pub_id.save!

  # pub = game_pub_id.publishers.create(
  #   pub_name: vg["publishers"]
  # )
  # puts pub.inspect
  # pub.save!

  g_pt_id = game_pub_id.game_platforms.create(
    game_publisher_id: game_pub_id.id,
    platform_id:       Platform.find_or_create_by(platform_name: vg["platforms"]).id,
    release_year:      vg["initial_release_date"]
  )
  puts g_pt_id.inspect
  # plat = game_pub_id.platforms.create(
  #   platform_name: vg["platforms"]
  # )
  # puts plat.inspect

  # region = Region.create(
  #   region_name: Faker::Address.country
  # )
  # puts region.inspect

  region_sales = g_pt_id.region_sales.create(
    region_id:        Region.find_or_create_by(region_name: Faker::Address.country).id,
    game_platform_id: g_pt_id.id,
    num_sales:        sales_num[i]
  )
  puts region_sales.inspect
end

# puts "Genre: " + genre.inspect
# puts "Game: " + game.inspect
# puts "Pub: " + game_pub.inspect
# puts "Platform: " + plat.inspect
# puts "Release Date: " + g_pt_id.inspect
# puts "Region: " + region.inspect
# puts "Region Sales: " + region_sales.inspect
# dev = game_devs.video_games.create(
#   game_dev:        vg["developers"]
# )

# puts "Invalid game #{vg['title']}" unless game&.valid?
# else
# puts "Invalid genre #{vg['genre']} for game #{vg['title']}."
# end

puts "Created #{Genre.count} Genres"
puts "Created #{Game.count} Games"
puts "Created #{Publisher.count} Publishers"
puts "Created #{Platform.count} Platforms"
puts "Created #{GamePublisher.count} GamePublishers"
puts "Created #{GamePlatform.count} GamePlatforms"
puts "Created #{Region.count} Regions"
puts "Created #{RegionSale.count} RegionSales"
