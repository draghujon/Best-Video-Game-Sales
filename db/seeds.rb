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
  # publisher = Publisher.find_or_create_by(pub_name: vg["publishers"])
  # platform = Platform.find_or_create_by(platform_name: vg["platforms"])
  # release_date = GamePlatform.find_or_create_by(release_year: vg["initial_release_date"])

  # if genre&.valid?
  # Create the game.

  # Genre.db
  # has_many :games
  # game = genre.games.create(
  #  game_name: vg["title"],
  #  game_dev:  vg["developers"]
  # )
  puts genre.inspect
  # Publisher.db
  # has_many :game_publishers
  # has_many :games, through: :game_publishers
  game_pub = Publisher.create(
    pub_name: vg["publishers"]
  )
  puts game_pub.inspect

  game = genre.games.create(
    game_name: vg["title"],
    game_dev:  vg["developers"],
    genre_id:  genre.id
  )

  puts game.inspect

  g_pub_id = GamePublisher.create(
    id:           vg["pub_id"],
    publisher_id: game_pub.id,
    game_id:      game.id
  )
  puts g_pub_id.inspect
  # Platform.db
  # has_many :game_platforms
  # has_many :game_publishers, through: :game_platforms
  plat = Platform.create(
    platform_name: vg["platforms"]
  )
  puts plat.inspect
  g_pt_id = GamePlatform.create(
    id:                vg["id"],
    game_publisher_id: game_pub.id,
    platform_id:       plat.id,
    release_year:      vg["initial_release_date"]
  )
  puts g_pt_id.inspect
  region = Region.create(
    region_name: Faker::Address.country
  )
  puts region.inspect

  region_sales = RegionSale.create(
    id:               Faker::Number.between(from: 1, to: 200),
    region_id:        region.id,
    game_platform_id: plat.id,
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
puts "Created #{Platform.count} Platforms"
