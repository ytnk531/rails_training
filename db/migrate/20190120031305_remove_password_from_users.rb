# frozen_string_literal: true

class RemovePasswordFromUsers < ActiveRecord::Migration[5.2]
  def up
    remove_column :users, :password
  end

  def down
    add_column :users, password, :string
  end
end
