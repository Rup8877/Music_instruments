class MusicCategory < ApplicationRecord
  has_many :music_instruments, dependent: :destroy
end
