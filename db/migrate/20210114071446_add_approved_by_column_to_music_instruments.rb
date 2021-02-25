# frozen_string_literal: true

class AddApprovedByColumnToMusicInstruments < ActiveRecord::Migration[6.0]
  def change
    add_column :music_instruments, :approved_by, :boolean, default: false
  end
end
