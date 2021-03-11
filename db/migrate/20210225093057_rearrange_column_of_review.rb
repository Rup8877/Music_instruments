# frozen_string_literal: true

class RearrangeColumnOfReview < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :rating, :integer
    remove_column :reviews, :feedback, :string
    remove_column :reviews, :created_at
    remove_column :reviews, :updated_at
    remove_reference :reviews, :user, null: false, foreign_key: true
    remove_reference :reviews, :music_instrument, null: false, foreign_key: true
    add_reference :reviews, :music_instrument, null: false, foreign_key: true
    add_reference :reviews, :user, null: false, foreign_key: true
    add_column :reviews, :rating, :integer, null: false
    add_column :reviews, :feedback, :string, null: false
    add_column :reviews, :created_at, :datetime, precision: 6, null: false
    add_column :reviews, :updated_at, :datetime, precision: 6, null: false
  end
end
