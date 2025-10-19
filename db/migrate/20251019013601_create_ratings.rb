class CreateRatings < ActiveRecord::Migration[8.0]
  def change
    create_table :ratings do |t|
      t.integer :stars
      t.references :project_album, null: false, foreign_key: true
      t.check_constraint "stars BETWEEN 1 and 5", name: "stars_range"
      t.timestamps
    end
  end
end
