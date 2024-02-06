class Project < ApplicationRecord
  has_many :card_columns, dependent: :destroy

  has_rich_text :description
end
