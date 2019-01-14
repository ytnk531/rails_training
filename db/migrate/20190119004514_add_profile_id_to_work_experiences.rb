# frozen_string_literal: true

class AddProfileIdToWorkExperiences < ActiveRecord::Migration[5.2]
  def change
    add_reference :work_experiences, :profile, foreign_key: true
  end
end
