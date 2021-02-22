class MusicCategory < ApplicationRecord
  
  has_many :music_instruments, dependent: :destroy
  has_many :sub_categories, dependent: :destroy
end
