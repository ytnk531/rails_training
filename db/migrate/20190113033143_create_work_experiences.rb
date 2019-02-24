# frozen_string_literal: true

class CreateWorkExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :work_experiences do |t|
      t.date :start
      t.date :end
      t.string :company_name

      t.timestamps
    end
  end
end
