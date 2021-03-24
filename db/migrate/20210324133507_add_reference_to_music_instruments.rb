class AddReferenceToMusicInstruments < ActiveRecord::Migration[6.0]
  def change
    add_column :music_instruments, :approved_by_id, :integer
  end
end
