class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :rank
      t.string :suit
      t.references :user_game

      t.timestamps
    end
    add_index :cards, :user_game_id
  end
end
