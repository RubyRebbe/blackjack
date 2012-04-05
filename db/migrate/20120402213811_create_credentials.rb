class CreateCredentials < ActiveRecord::Migration
  def change
    create_table :credentials do |t|
      t.string :name
      t.string :password
      t.references :user

      t.timestamps
    end
    add_index :credentials, :user_id
  end
end
