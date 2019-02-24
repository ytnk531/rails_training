class RenameColumnOnProfiles < ActiveRecord::Migration[5.2]
  def change
    rename_column :profiles, :github_url, :github_id
    rename_column :profiles, :facebook, :facebook_id
    rename_column :profiles, :twitter, :twitter_id
  end
end
