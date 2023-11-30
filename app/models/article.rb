class Article < ApplicationRecord
  has_one_attached :image

  has_many :checks, dependent: :destroy
  has_many :users, through: :checks

  with_options presence: true do
    validates :title
    validates :poster
    validates :content
  end
end
