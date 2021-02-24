require 'rails_helper'

RSpec.describe Message, type: :model do

  subject(:message) { FactoryBot.build(:message) }

  #validation_test
  describe "user name presence" do
    context "user name is present" do
      it "user having a name is valid" do
        expect(subject).to be_valid
      end
    end
    context "user name is not present" do
      it "user having no name is invalid" do
        subject.body = ""
        expect(subject).not_to be_valid
      end
    end
  end

  describe "body length" do
      context "with valid body length" do
        it "message having body of length within 1 and 1000 characters is valid" do
          expect(subject).to be_valid
        end
      end
      context "with invalid body length" do
        it "message not having body of length within 1 and 1000 characters is invalid" do
          subject.body = ""
          expect(subject).not_to be_valid
        end
      end
    end

    describe "belongs_to :conversation" do
        it { is_expected.to belong_to :conversation}
      end

      describe "belongs_to :user" do
          it { is_expected.to belong_to :user }
        end
end
