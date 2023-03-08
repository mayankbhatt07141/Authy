class RemoveDefaultValueFromVerificationToken < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :verification_token, :string, default: nil
  end
end
