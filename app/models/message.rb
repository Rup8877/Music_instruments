# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates_presence_of :body, length: { minimum: 1, maximum: 1000 }
end
