class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  validates :title, :text, presence: true
  validates :title, length: { minimum: 6 }

  after_validation :format_title

  scope :latest, -> { order("created_at DESC").limit(5) }

  def format_title
    self.title = title.titleize
  end
end
