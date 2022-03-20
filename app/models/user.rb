class User < ApplicationRecord
  has_many :watches, dependent: :destroy
  has_many :watch_videos, through: :watches, source: :video
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_videos, through: :bookmarks, source: :video

  validates :line_user_id, presence: true, uniqueness: true

  enum role: { general: 0, admin: 1 }

  def watch?(video)
    watch_videos.include?(video)
  end

  def watch(video)
    watch_videos << video
  end

  def unwatch(video)
    watch_videos.destroy(video)
  end

  def bookmark?(video)
    bookmark_videos.include?(video)
  end

  def bookmark(video)
    bookmark_videos << video
  end

  def unbookmark(video)
    bookmark_videos.destroy(video)
  end
end
