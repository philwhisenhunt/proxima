class AddNameSlugToProjects < ActiveRecord::Migration[8.0]
  def change
    add_column :projects, :name_slug, :string
  end
end
