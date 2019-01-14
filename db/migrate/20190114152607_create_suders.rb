# frozen_string_literal: true

class CreateSuders < ActiveRecord::Migration[5.2]
  def change
    create_table :suders do |t|
      t.string :emp_no

      t.timestamps
    end
  end
end
