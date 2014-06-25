class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user


  scope :latest, -> { order("created_at DESC").limit(5) }
end
