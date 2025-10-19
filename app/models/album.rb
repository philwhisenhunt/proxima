class Album < ApplicationRecord
    has_many :project_albums, dependent: :destroy
    has_many :projects, through: :project_albums
    has_many :ratings, through: :project_albums
end
