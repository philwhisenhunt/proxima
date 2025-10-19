class ProjectAlbum < ApplicationRecord
  belongs_to :project
  belongs_to :album
  has_many :ratings, dependent: :destroy
end
