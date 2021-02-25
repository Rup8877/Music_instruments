class ChangeColumnToNullOfMusicInstrument < ActiveRecord::Migration[6.0]
  def change
    change_column_null :music_instruments, :item_tittle, false
    change_column_null :music_instruments, :item_description, false
    change_column_null :music_instruments, :price, false
    change_column_null :music_instruments, :phone_number, false
    change_column_null :music_instruments, :music_category_id, false
    change_column_null :music_instruments, :user_id, false
    change_column_null :music_instruments, :created_at, false
    change_column_null :music_instruments, :updated_at, false
    change_column_null :music_instruments, :role, false
    change_column_null :music_instruments, :approved_by, false
  end
end
