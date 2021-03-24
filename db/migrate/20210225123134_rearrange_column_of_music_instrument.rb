# frozen_string_literal: true

class RearrangeColumnOfMusicInstrument < ActiveRecord::Migration[6.0]
  def change
    remove_column :music_instruments, :item_tittle, :string
    remove_column :music_instruments, :item_description, :text
    remove_column :music_instruments, :phone_number, :integer
    remove_column :music_instruments, :price, :integer
    remove_column :music_instruments, :role, :string
    remove_column :music_instruments, :approved_by, :boolean
    remove_column :music_instruments, :created_at
    remove_column :music_instruments, :updated_at
    remove_reference :music_instruments, :music_category, null: false, foreign_key: true
    remove_reference :music_instruments, :user, null: false, foreign_key: true
    add_reference :music_instruments, :music_category, foreign_key: true
    add_reference :music_instruments, :user, foreign_key: true 
    add_column :music_instruments, :item_tittle, :string
    add_column :music_instruments, :item_description, :text
    add_column :music_instruments, :phone_number, :integer
    add_column :music_instruments, :price, :integer
    add_column :music_instruments, :role, :string
    add_column :music_instruments, :approved_by, :boolean, default: false
    add_column :music_instruments, :created_at, :datetime, precision: 6
    add_column :music_instruments, :updated_at, :datetime, precision: 6
  end
end
