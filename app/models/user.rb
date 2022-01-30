class User < ApplicationRecord
  has_many :watches, dependent: :destroy
  has_many :videos, through: :watches

  validates :line_user_id, presence: true, uniqueness: true

  def watch?(video)
    videos.include?(video)
  end

  def watch(video)
    videos << video
  end

  def unwatch(video)
    videos.destroy(video)
  end
end
