class CreateTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :owner
      t.string :yahoo_team_id
      t.integer :wins
      t.integer :losses
      t.integer :ties
      t.decimal :points_for
      t.decimal :points_against

      t.timestamps
    end
  end
end
