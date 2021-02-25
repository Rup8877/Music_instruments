# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    rating { 3 }
    feedback { 'good' }
    music_instrument
    user
  end
end
