# frozen_string_literal: true

class AddApprovedByIdColumnToMusicInstrumentTable < ActiveRecord::Migration[6.0]
  def change
    add_column :music_instruments, :approved_by_id, :string, default: 0
  end
end
