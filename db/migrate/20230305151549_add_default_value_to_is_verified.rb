class AddDefaultValueToIsVerified < ActiveRecord::Migration[7.0]
  def change
    change_column :verified_users, :is_verified, :boolean, default: false
  end
end
