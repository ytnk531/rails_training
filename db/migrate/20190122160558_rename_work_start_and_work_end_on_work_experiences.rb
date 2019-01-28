# frozen_string_literal: true

class RenameWorkStartAndWorkEndOnWorkExperiences < ActiveRecord::Migration[5.2]
  def change
    rename_column :work_experiences, :work_start, :work_start_on
    rename_column :work_experiences, :work_end, :work_end_on
  end
end
