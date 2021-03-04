# frozen_string_literal: true

class CreateMusicInstruments < ActiveRecord::Migration[6.0]
  def change
    create_table :music_instruments do |t|
      t.string :item_tittle
      t.text :item_description
      t.integer :phone_number
      t.integer :price

      t.timestamps
    end
  end
end
