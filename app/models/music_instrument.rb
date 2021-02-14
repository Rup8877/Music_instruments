class MusicInstrument < ApplicationRecord
  searchkick
  belongs_to :music_category
  belongs_to :user
  has_many_attached :images , dependent: :destroy
  has_many:reviews ,dependent: :destroy


validates :item_tittle, presence: true
validates :item_description, presence: true
validates :phone_number, presence: true, uniqueness: true
validates :price, presence: true,numericality: { greater_than_or_equal_to: 1 }


  attr_accessor :remove_image
  after_save :purge_remove_image ,if: :remove_image
   private def purge_remove_image
     images.purge_later
   end
end
