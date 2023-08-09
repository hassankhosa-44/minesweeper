class Board < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :width, :height, numericality: { greater_than: 0 }
  validates :mines, numericality: { less_than_or_equal_to: ->(board) { board.width * board.height } }

  serialize :data, Array
end
