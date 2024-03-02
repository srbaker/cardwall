class Project < ApplicationRecord
  has_many :lanes, -> { order(position: :asc) }, dependent: :destroy

  has_rich_text :description
end
