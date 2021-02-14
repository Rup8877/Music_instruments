class AddIndexToColumn < ActiveRecord::Migration[6.0]
  def change
    add_index :music_categories, :category, unique: true
  end
end
