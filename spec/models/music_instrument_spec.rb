# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MusicInstrument, type: :model do
  subject(:music_instrument) { FactoryBot.build(:music_instrument) }

  # validation_test
  describe 'item_tittle presence' do
    context 'when item_tittle is present' do
      it 'item_tittle is present is valid' do
        expect(subject).to be_valid
      end
    end
    context ' when item_tittle is not present' do
      it 'item_tittle not present is invalid' do
        subject.item_tittle = ''
        expect(subject).not_to be_valid
      end
    end
  end

  describe 'item_tittle length' do
    context 'with valid item_tittle length' do
      it 'music_instrument having item_tittle of length within 2 and 50 characters is valid' do
        expect(subject).to be_valid
      end
    end
    context 'with invalid item_tittle length' do
      it 'music_instrument not having item_tittle of length within 2 and 50 characters is invalid' do
        subject.item_tittle = 'R'
        expect(subject).not_to be_valid
      end
    end
  end

  describe 'item_description presence' do
    context 'when item_description is present' do
      it 'item_description is present is valid' do
        expect(subject).to be_valid
      end
    end
    context 'when item_description is not present' do
      it 'item_description not present is invalid' do
        subject.item_description = ''
        expect(subject).not_to be_valid
      end
    end
  end

  describe 'item_description length' do
    context 'with valid item_description length' do
      it 'music_instrument having item_description of length within 10 and 5000 characters is valid' do
        expect(subject).to be_valid
      end
    end
    context 'with invalid item_description length' do
      it 'music_instrument not having item_description of length within 10 and 5000 characters is invalid' do
        subject.item_description = 'Rupesh'
        expect(subject).not_to be_valid
      end
    end
  end

  describe ' phone_number presence' do
    context 'when phone_number is present' do
      it 'phone_number is present is valid' do
        expect(subject).to be_valid
      end
    end
    context 'when phone_number is not present' do
      it 'phone_number not present is invalid' do
        subject.phone_number = nil
        expect(subject).not_to be_valid
      end
    end
  end

  describe ' price is numeric' do
    context 'when price is numeric' do
      it 'price is numeric is valid' do
        expect(subject).to be_valid
      end
    end
    context 'when price is not numeric' do
      it 'price not numeric is invalid' do
        subject.price = 'aa'
        expect(subject).not_to be_valid
      end
    end
  end

  describe 'music_instrument minimum price' do
    context 'with valid music_instrument price' do
      it 'music_instrument price greater and equal to 1 is valid' do
        expect(subject).to be_valid
      end
    end
    context 'with invalid music_instrument price' do
      it 'music_instrument not having price is invalid' do
        subject.price = -10
        expect(subject).not_to be_valid
      end
    end
  end

  # associations_test

  describe 'has_many :reviews' do
    it { is_expected.to have_many :reviews }
  end

  describe 'has_many_attached :images' do
    it { is_expected.to have_many_attached :images }
  end

  describe 'belongs_to :music_category' do
    it { is_expected.to belong_to :music_category }
  end

  describe 'belongs_to :user' do
    it { is_expected.to belong_to :user }
  end
end
