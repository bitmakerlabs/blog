class Article < ActiveRecord::Base
  has_many :comments

  scope :latest, -> { order("created_at DESC").limit(5) }
end
