# frozen_string_literal: true

FactoryBot.define do
  factory :music_instrument, class: MusicInstrument do
    item_tittle { 'Harmonium' }
    item_description do
      'Harmonium is a musical instrument which is a free-reed organ that generates sound as air flows past a vibrating piece of thin metal in a frame.'
    end
    phone_number { 9_658_455_458 }
    price { 200 }
    user
    music_category
  end
end
