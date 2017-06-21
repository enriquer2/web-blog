class Comment < ApplicationRecord
  belongs_to :article
  validates :score, numericality: {greater_than: 1, less_than: 11}
end
