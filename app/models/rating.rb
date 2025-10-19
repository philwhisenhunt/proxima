class Rating < ApplicationRecord
  belongs_to :project_album

  validates :stars, inclusion: { in: 1..5, message: "must be between 1 and 5" }
  
end
