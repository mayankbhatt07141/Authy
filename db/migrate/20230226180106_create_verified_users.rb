class CreateVerifiedUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :verified_users do |t|
      t.references :user, null: false, foreign_key: true
      t.boolean :is_verified

      t.timestamps
    end
  end
end
