# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# RUN bundle exec rails db:setup

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

simon = User.create(username: 'Simon')
hansaem = User.create(username: 'Hansaem')
sam = User.create(username: 'Sam')

art1 = Artwork.create(title: 'hello', image_url: 'aa', artist_id: 3)
art2 = Artwork.create(title: 'hey', image_url: 'bb', artist_id: 2)
art3 = Artwork.create(title: 'howdy', image_url: 'cc', artist_id: 1)

art_share1 = ArtworkShare.create(artwork_id: 1, viewer_id: 1)
art_share2 = ArtworkShare.create(artwork_id: 1, viewer_id: 2)
art_share3 = ArtworkShare.create(artwork_id: 3, viewer_id: 3)
