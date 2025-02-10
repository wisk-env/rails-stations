# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Movie.create!(name: "劇場版テック", year: "2022", description: "主演はトーレン", image_url: "https://picsum.photos/seed/picsum/800/400", is_showing: "true")
# Movie.create!(name: "劇場版テック", year: "2022", description: "主演はトーレン", image_url: "https://picsum.photos/seed/picsum/800/400", is_showing: "false")
# Schedule.create!(movie_id: "1", start_time: "2024-10-1 9:00:00", end_time: "2024-10-1 11:00:00")
# Schedule.create!(movie_id: "5", start_time: "2024-12-1 9:00:00", end_time: "2024-12-1 11:00:00")
# Schedule.create!(movie_id: "6", start_time: "2024-11-1 9:00:00", end_time: "2024-11-1 11:00:00")

# [
#   ['a', '1'],['a', '2'],['a', '3'],['a', '4'],['a', '5'],
#   ['b', '1'],['b', '2'],['b', '3'],['b', '4'],['b', '5'],
#   ['c', '1'],['c', '2'],['c', '3'],['c', '4'],['c', '5']
# ].each do |row, column|
#   Sheet.create!(
#     { row: row, column: column}
#   )
# end
