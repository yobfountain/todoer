# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

artist1 = Artist.create(name: "Picasso")
museum1 = Museum.create(name: "MOMA")

Painting.create(name: "Guernica", artist_id: artist1.id, museum_id: museum1.id)

#need associations set up
Painting.create(name: "Guernica", artist: artist1, museum: museum1)