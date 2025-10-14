class CreateProjectAlbums < ActiveRecord::Migration[8.0]
  def change
    create_table :project_albums do |t|
      t.references :project, null: false, foreign_key: true
      t.references :album, null: false, foreign_key: true
      t.integer :day_number
      t.date :rated_on
      t.integer :rating
      t.text :notes

      t.timestamps
    end
  end
end
