class ProjectAlbum < ApplicationRecord
  belongs_to :project
  belongs_to :album
  has_one :rating, dependent: :destroy
end
