class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image

  validates :title, presence: true
  validates :summary, presence: true
  validates :body, presence: true
  validates :image,
            content_type: {
              in: %w[image/jpeg image/gif image/png],
              message: 'must be a valid image format (jpeg, gif, or png)'
            },
            size: {
              less_than: 5.megabytes,
              message: 'must be less than 5MB'
            }

  # Returns resized image for display
  def display_image
    image.variant(resize_to_limit: [500, 500])
  end
end
