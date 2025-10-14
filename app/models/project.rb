class Project < ApplicationRecord
    has_many :project_albums, dependent: :destroy
    has_many :albums, through: :project_albums
end
