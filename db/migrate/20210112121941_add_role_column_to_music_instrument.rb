class AddRoleColumnToMusicInstrument < ActiveRecord::Migration[6.0]
  def change
    add_column :music_instruments, :role, :string
  end
end
