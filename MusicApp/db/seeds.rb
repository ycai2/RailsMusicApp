# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(email: 'test1@gmail.com', password: '123456')
user2 = User.create(email: 'test2@gmail.com', password: '123456')
user3 = User.create(email: 'test3@gmail.com', password: '123456')
user4 = User.create(email: 'test4@gmail.com', password: '123456')

band1 = Band.create(name: 'The Beatles')
band2 = Band.create(name: 'The Rolling Stones')
band3 = Band.create(name: 'Appacademy TAs')

album1 = Album.create(name: 'Let It Be', band_id: band1.id, yr: 1970, live: true)
album2 = Album.create(name: 'Please Please Me', band_id: band1.id, yr: 1963, live: false)
album3 = Album.create(name: 'Onto Rails', band_id: band3.id, yr: 2015, live: false)
album4 = Album.create(name: 'Learn Ruby', band_id: band3.id, yr: 2015, live: true)
album5 = Album.create(name: 'Learn Ruby Part II', band_id: band3.id, yr: 2016, live: false)
album6 = Album.create(name: 'Style Matters', band_id: band3.id, yr: 2016, live: false)
