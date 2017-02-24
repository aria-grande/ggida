# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Manager.create!(username: 'manager1', email: 'test@ggida.org', password: '123456')
Party.create!(title: 'party tonight', contents: 'conetents of the party', place:'startup campus', contact_number:'01011111111', contact_email:'test@ggida.org', address:'South Korea', min_participants: 3, max_participants: 5, start_date: Time.zone.now, end_date: Time.zone.now+2.days)