class Message < ApplicationRecord
  has_one_attached :attached_file

  belongs_to :room
  belongs_to :user

  validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.attached_file.attached?
  end
end
