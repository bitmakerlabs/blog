class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :title, :text, presence: true
  validates :title, length: { minimum: 6 }


  scope :latest, -> { order("created_at DESC").limit(5) }
end
