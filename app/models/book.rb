class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites

  validates :body, length: {maximum: 200}, presence: true
  validates :title, presence: true


end
