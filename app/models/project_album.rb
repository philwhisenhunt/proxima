class ProjectAlbum < ApplicationRecord
  belongs_to :project
  belongs_to :album
end
