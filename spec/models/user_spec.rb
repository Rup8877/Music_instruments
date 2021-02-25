# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { FactoryBot.build(:user) }

  # validation_test
  describe 'user name presence' do
    context 'user name is present' do
      it 'user having a name is valid' do
        expect(subject).to be_valid
      end
    end
    context 'user name is not present' do
      it 'user having no name is invalid' do
        subject.name = ''
        expect(subject).not_to be_valid
      end
    end
  end

  describe 'user name length' do
    context 'with valid user name length' do
      it 'user having name of length within 2 and 35 characters is valid' do
        expect(subject).to be_valid
      end
    end
    context 'with invalid user name length' do
      it 'user not having name of length within 2 and 35 characters is invalid' do
        subject.name = 'R'
        expect(subject).not_to be_valid
      end
    end
  end

  describe '.user_name_format' do
    context 'with valid format of Username' do
      it 'user containg name with uppercase, lowercase letters and blank spaces is valid' do
        expect(subject).to be_valid
      end
    end
    context 'with not valid format of Username' do
      it 'user containg name with digits and special characters is invalid' do
        subject.name = 'Rupesh123'
        expect(subject).not_to be_valid
      end
    end
  end

  describe '.user_email_length' do
    context 'with valid user email length' do
      it 'user having email of length within 8 and 80 characters is valid' do
        expect(subject).to be_valid
      end
    end
    context 'with invalid user email length' do
      it 'user not having email of length within 8 and 80 characters is invalid' do
        subject.email = 'a@b.in'
        expect(subject).not_to be_valid
      end
    end
  end

  describe '.user_email_uniqueness' do
    let(:user_duplicate) { User.new(name: 'person', email: 'student@gmail.com', password: '123456') }
    context 'with unique user email' do
      it 'user having unique email is valid' do
        expect(user_duplicate.email).not_to eq(subject.email)
      end
    end
    context 'with non-unique user email' do
      it 'user not having unique email is invalid' do
        subject.email = 'student@gmail.com'
        expect(user_duplicate.email).to eq(subject.email)
      end
    end
  end

  describe '.user_email_format' do
    context 'with valid user email format' do
      it 'user containing email with the format __@__.__is valid' do
        expect(subject).to be_valid
      end
    end
    context 'with invalid user email format' do
      it 'user not containing email with the format __@__.__ is invalid' do
        subject.email = 'student.com'
        expect(subject).not_to be_valid
      end
    end
  end

  describe '#user_password_presence' do
    context 'when user password present' do
      it 'user having a password is valid' do
        expect(subject).to be_valid
      end
    end
    context 'when user password not present' do
      it 'user having no password is invalid' do
        subject.password = nil
        expect(subject).not_to be_valid
      end
    end
  end

  describe '#user_password_length' do
    context 'with valid user password length' do
      it 'user having password of length within 6 and 20 characters is valid' do
        expect(subject).to be_valid
      end
    end
    context 'with invalid user password length' do
      it 'user not having password of length within 6 and 20 characters is invalid' do
        subject.password = '12345'
        expect(subject).not_to be_valid
      end
    end
  end

  # associations_test

  describe 'has_many :music_instruments' do
    it { is_expected.to have_many :music_instruments }
  end

  describe 'has_many :messages' do
    it { is_expected.to have_many :messages }
  end

  describe 'has_many :reviews' do
    it { is_expected.to have_many :reviews }
  end

  describe 'has_secure_password' do
    it { is_expected.to have_secure_password }
  end

  describe '#find_or_create_from_auth_hash' do
    context 'with registered user' do
      it 'using omniauth' do
        user = FactoryBot.create(:user, email: 'something@google.com', provider: 'google', uid: '12345678910')
        OmniAuth.config.test_mode = true
        expect(User.find_or_create_from_auth_hash(OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
                                                                                                                provider: 'google',
                                                                                                                uid: '12345678910',
                                                                                                                info: {
                                                                                                                  email: 'student@gmail.com',
                                                                                                                  name: 'Aman Singh'
                                                                                                                },
                                                                                                                credentials: {
                                                                                                                  token: 'abcdefg12345',
                                                                                                                  refresh_token: 'abcdefg12345',
                                                                                                                  expires_at: DateTime.now
                                                                                                                }
                                                                                                              }))).to eq(user)
      end
    end
  end
end
