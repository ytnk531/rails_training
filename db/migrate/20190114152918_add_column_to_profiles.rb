# frozen_string_literal: true

class AddColumnToProfiles < ActiveRecord::Migration[5.2]
  def change
    remove_column :profiles, :user_id
    add_reference :profiles, :user, foreign_key: true
    add_column :profiles, :github_url, :string
    add_column :profiles, :facebook, :string
    add_column :profiles, :twitter, :string
  end
end
