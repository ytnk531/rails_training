# frozen_string_literal: true

class DropSuders < ActiveRecord::Migration[5.2]
  def change
    drop_table :suders
  end
end
