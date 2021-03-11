# frozen_string_literal: true

class MusicCategory < ApplicationRecord
  has_many :music_instruments, dependent: :destroy
  has_many :sub_categories
  validates :category, presence: true, length: { minimum: 2, maximum: 50 }, uniqueness: true
end
