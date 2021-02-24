class MusicInstrument < ApplicationRecord
  searchkick

  belongs_to :music_category
  belongs_to :user

  has_many_attached :images
  has_many:reviews ,dependent: :destroy


validates :item_tittle, presence: true, length: { maximum: 50, minimum: 2 }
validates :item_description, presence: true ,length: { maximum: 5000, minimum: 10}
validates :phone_number, presence: true, numericality: true, length: { is: 10 }
validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }

end
