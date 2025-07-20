class CreateMatchups < ActiveRecord::Migration[8.0]
  def change
    create_table :matchups do |t|
      t.references :home_team, null: false, foreign_key: { to_table: :teams }
      t.references :away_team, null: false, foreign_key: { to_table: :teams }
      t.integer :week
      t.integer :year
      t.decimal :home_score
      t.decimal :away_score
      t.references :winner, null: true, foreign_key: { to_table: :teams }

      t.timestamps
    end
  end
end
