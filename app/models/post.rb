class Post < ApplicationRecord
  has_many :comments
  
  validates :title, presence: true
  validates :summary, presence: true
  validates :body, presence: true
end
