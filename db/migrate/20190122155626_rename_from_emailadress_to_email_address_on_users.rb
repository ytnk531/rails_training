class RenameFromEmailadressToEmailAddressOnUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :emailAddress, :email_address
  end
end
