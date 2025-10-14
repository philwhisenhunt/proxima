class AddTitleAndYearToAlbum < ActiveRecord::Migration[8.0]
  def change
    add_column :albums, :year, :integer
    add_column :albums, :title, :string
  end
end
