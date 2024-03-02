class Project < ApplicationRecord
  has_many :lanes, -> { order(position: :asc) }, dependent: :destroy
  acts_as_list scope: :lanes

  has_rich_text :description
end
