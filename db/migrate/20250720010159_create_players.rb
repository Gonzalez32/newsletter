class CreatePlayers < ActiveRecord::Migration[8.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.references :team, null: false, foreign_key: true
      t.string :yahoo_player_id

      t.timestamps
    end
  end
end
