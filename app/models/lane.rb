class Lane < ApplicationRecord
  belongs_to :project
  has_many :cards, -> { order(position: :asc) }, dependent: :destroy
  acts_as_list scope: :project

  validates :title, presence: true
end
