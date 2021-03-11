# frozen_string_literal: true

class RearrangeColumnOfMessage < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages, :body, :text
    remove_column :messages, :created_at
    remove_column :messages, :updated_at
    remove_reference :messages, :conversation
    remove_reference :messages, :user
    add_reference :messages, :conversation, null: false, foreign_key: true
    add_reference :messages, :user, null: false, foreign_key: true
    add_column :messages, :body, :text, null: false
    add_column :messages, :created_at, :datetime, null: false
    add_column :messages, :updated_at, :datetime, null: false
  end
end
