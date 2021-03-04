# frozen_string_literal: true

class AddColumnToUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string, null:false
  end
end
