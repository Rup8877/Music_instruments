# frozen_string_literal: true

class CreateMusicCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :music_categories do |t|
      t.string :category, null: false
      
      t.references  :parent
      t.timestamps
    end
  end
end
