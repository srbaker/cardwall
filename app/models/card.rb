class Card < ApplicationRecord
  belongs_to :card_column
  has_rich_text :body
end
