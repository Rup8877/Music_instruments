# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MusicCategory, type: :model do
  subject(:music_category) { FactoryBot.build(:music_category) }

  # validation_test
  describe 'category presence' do
    context 'category is present' do
      it 'category is present is valid' do
        expect(subject).to be_valid
      end
    end
    context 'category is not present' do
      it 'category not present is invalid' do
        subject.category = ' '
        expect(subject).not_to be_valid
      end
    end
  end

  describe 'music_category category length' do
    context 'with valid category length' do
      it 'music_category having category of length within 2 and 50 characters is valid' do
        expect(subject).to be_valid
      end
    end
    context 'with invalid category length' do
      it 'music_category not having category of length within 2 and 50 characters is invalid' do
        subject.category = 'R'
        expect(subject).not_to be_valid
      end
    end
  end

  # associations_test

  describe 'has_many :music_instruments' do
    it { is_expected.to have_many :music_instruments }
  end

  
end
