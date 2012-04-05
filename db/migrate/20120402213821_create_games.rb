class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.boolean :win
      t.boolean :lose
      t.boolean :tie

      t.timestamps
    end
  end
end
