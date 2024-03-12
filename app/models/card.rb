class Card < ApplicationRecord
  belongs_to :lane
  has_rich_text :body
  acts_as_list scope: :lane
end
