# frozen_string_literal: true

class AddReferenceToSubCategory < ActiveRecord::Migration[6.0]
  def change
    add_reference :sub_categories, :music_category, null: false, foreign_key: true
  end
end
