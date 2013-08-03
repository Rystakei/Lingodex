# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u = User.new
d1 = Deck.new
d1.subject = "French"
d1.user_id = 1
u.save
d1.save

c1 = Card.new
c1.term = "boire"
c1.definition = "to drink"
c1.deck_id = 1
c1.save

c2 = Card.new
c2.term = "croire"
c2.definition = "to believe"
c2.deck_id = 1
c2.save

c3 = Card.new
c3.term = "avoir"
c3.definition = "to have"
c3.deck_id = 1
c3.save