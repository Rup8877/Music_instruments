class AddUsersColumnToMusicInstruments < ActiveRecord::Migration[6.0]
  def change
    add_reference :music_instruments, :user, foreign_key: true
  end
end
