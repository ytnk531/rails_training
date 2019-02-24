# frozen_string_literal: true

class ChangeUsersToRole < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role, :string, default: "USER"
  end
end
