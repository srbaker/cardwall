class Project < ApplicationRecord
  has_many :lanes, dependent: :destroy

  has_rich_text :description
end
