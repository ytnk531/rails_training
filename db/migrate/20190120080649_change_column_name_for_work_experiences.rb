class ChangeColumnNameForWorkExperiences < ActiveRecord::Migration[5.2]
  def change
    rename_column :work_experiences, :start, :work_start
    rename_column :work_experiences, :end, :work_end
  end
end
