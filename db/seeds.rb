# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'admin', email: 'admin@gmail.com', password: '123456', admin: true)

User.create(name: 'Rupesh', email: 'rup@gmail.com', password: '123456')
User.create(name: 'raja', email: 'raja@gmail.com', password: '123456')
User.create(name: 'rahul', email: 'rahul@gmail.com', password: '123456')

MusicCategory.create(category: 'Tabla')
MusicCategory.create(category: 'Drum')
MusicCategory.create(category: 'Guitar')
MusicCategory.create(category: 'Keyboard')

SubCategory.create(name: 'Tabla A', music_category_id: 1)
SubCategory.create(name: 'Tabla B', music_category_id: 1)
SubCategory.create(name: 'Drum A', music_category_id: 2)
SubCategory.create(name: 'Electric Guitar', music_category_id: 3)
SubCategory.create(name: 'Traditional Keyboard', music_category_id: 4)

music_instrument = MusicInstrument.new
music_instrument.user_id = User.first.id
music_instrument.music_category_id = MusicCategory.first.id
music_instrument.sub_category_id = SubCategory.first.id
music_instrument.item_tittle = 'tabla'
music_instrument.item_description = 'A tabla is a pair of twin hand drums from the Indian subcontinent.'
music_instrument.phone_number = 9_645_879_523
music_instrument.price = 500
music_instrument.role = 'buyer'
music_instrument.approved_by = true
music_instrument.images.attach(io: File.open(Rails.root.join('app/assets/images/tabla.jpeg')), filename: 'tabla.jpeg')
music_instrument.save!

music_instrument = MusicInstrument.new
music_instrument.user_id = User.second.id
music_instrument.music_category_id = MusicCategory.second.id
music_instrument.sub_category_id = SubCategory.third.id
music_instrument.item_tittle = 'drum'
music_instrument.item_description = 'The drum is a member of the percussion group of musical instruments.'
music_instrument.phone_number = 9_589_665_563
music_instrument.price = 400
music_instrument.role = 'seller'
music_instrument.approved_by = true
music_instrument.images.attach(io: File.open(Rails.root.join('app/assets/images/drum.jpeg')), filename: 'drum.jpeg')
music_instrument.save!

music_instrument = MusicInstrument.new
music_instrument.user_id = User.third.id
music_instrument.music_category_id = MusicCategory.third.id
music_instrument.sub_category_id = SubCategory.fourth.id
music_instrument.item_tittle = 'guitar'
music_instrument.item_description = 'The guitar is a fretted musical instrument that typically has six strings.'
music_instrument.phone_number = 9_645_879_598
music_instrument.price = 300
music_instrument.role = 'buyer'
music_instrument.images.attach(io: File.open(Rails.root.join('app/assets/images/guitar.jpeg')), filename: 'guitar.jpeg')
music_instrument.save!

music_instrument = MusicInstrument.new
music_instrument.user_id = User.fourth.id
music_instrument.music_category_id = MusicCategory.fourth.id
music_instrument.sub_category_id = SubCategory.fifth.id
music_instrument.item_tittle = 'keyboard'
music_instrument.item_description = 'good for using'
music_instrument.phone_number = 9_645_879_958
music_instrument.price = 700
music_instrument.role = 'seller'
music_instrument.images.attach(io: File.open(Rails.root.join('app/assets/images/keyboard.jpeg')),
                               filename: 'keyboard.jpeg')
music_instrument.save!
