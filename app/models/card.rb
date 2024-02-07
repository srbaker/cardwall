class Card < ApplicationRecord
  belongs_to :lane

  has_rich_text :body
end
