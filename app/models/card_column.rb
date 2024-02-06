class CardColumn < ApplicationRecord
  belongs_to :project

  has_many :cards, dependent: :destroy

  validates :title, presence: true
end
