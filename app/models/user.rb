class User < ApplicationRecord
  has_secure_password
  has_many :music_instruments, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :email, presence:true


  def self.find_or_create_from_auth_hash(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.name =auth.info.name
        user.email = auth.info.email
        user.password = '123456'
        user.save!
      end
    end


end
