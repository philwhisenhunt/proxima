class Project < ApplicationRecord
    has_many :project_albums, dependent: :destroy
    has_many :albums, through: :project_albums


    def name_without_spaces
        name.downcase.gsub(" ", "-")
    end
end
