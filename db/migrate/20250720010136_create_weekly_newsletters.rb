class CreateWeeklyNewsletters < ActiveRecord::Migration[8.0]
  def change
    create_table :weekly_newsletters do |t|
      t.string :title
      t.text :content
      t.datetime :published_at
      t.integer :week
      t.integer :year
      t.boolean :featured

      t.timestamps
    end
  end
end
