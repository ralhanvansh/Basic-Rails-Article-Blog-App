class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user
  validates :title, presence: true, length: { minimum: 5}

  after_create do
    NewsletterJob.perform_later(self.user_id)
  end
end
