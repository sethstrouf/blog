class Post < ApplicationRecord
  has_many :comments
  has_one_attached :image
  
  validates :title, presence: true
  validates :summary, presence: true
  validates :body, presence: true
end
