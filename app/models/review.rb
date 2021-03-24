# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :music_instrument
  belongs_to :user

  validates :feedback, presence: true, length: { maximum: 200, minimum: 2 }
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates_uniqueness_of :user_id , scope: :music_instrument_id
  
end
