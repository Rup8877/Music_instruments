# frozen_string_literal: true

class AddMusicCategoryToMusicInstruments < ActiveRecord::Migration[6.0]
  def change
    add_reference :music_instruments, :music_category, null: false, foreign_key: true
  end
end
