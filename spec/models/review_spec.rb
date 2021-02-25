# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  subject(:review) { FactoryBot.build(:review) }

  # validation_test
  describe 'feedback presence' do
    context 'when feedback is present' do
      it 'review having feedback is valid' do
        expect(subject).to be_valid
      end
    end
    context 'feedback is not present' do
      it 'review having no feedback is invalid' do
        subject.feedback = ''
        expect(subject).not_to be_valid
      end
    end
  end

  describe 'feedback length' do
    context 'with valid feedback length' do
      it 'review having feedback of length within 2 and 200 characters is valid' do
        expect(subject).to be_valid
      end
    end
    context 'with invalid feedback length' do
      it 'review not having feedback of length within 2 and 200 characters is invalid' do
        subject.feedback = 'h'
        expect(subject).not_to be_valid
      end
    end
  end

  describe 'rating presence' do
    context 'when rating is present' do
      it 'review having rating is valid' do
        expect(subject).to be_valid
      end
    end
    context 'rating is not present' do
      it 'review having no rating is invalid' do
        subject.rating = ''
        expect(subject).not_to be_valid
      end
    end
  end

  describe ' rating is numeric' do
    context 'when rating is numeric' do
      it 'rating is numeric is valid' do
        expect(subject).to be_valid
      end
    end
    context 'when rating is not numeric' do
      it 'rating not numeric is invalid' do
        subject.rating = 'aa'
        expect(subject).not_to be_valid
      end
    end
  end

  describe '.review rating value' do
    context 'review rating with valid value' do
      it 'review having rating within 1 to 5  is valid' do
        expect(subject).to be_valid
      end
    end
    context 'review rating with not valid value' do
      it 'review not having rating within 1 to 5 is not valid' do
        subject.rating = 6
        expect(subject).not_to be_valid
      end
    end
  end

  describe 'belongs_to :music_instrument' do
    it { is_expected.to belong_to :music_instrument }
  end

  describe 'belongs_to :user' do
    it { is_expected.to belong_to :user }
  end
end
