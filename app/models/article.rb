class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, presence: true, length: {minimum: 5}
    validates :subtitle, presence: true, length: {maximum: 20, minimum: 1 + :title.length}
end
