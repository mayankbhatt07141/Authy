class AddDefaultValueToVerificationToken < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :verification_token, :boolean, default: false
  end
end
