class Video < ApplicationRecord
  validates :youtube_id, presence: true

  # entry: 入門編、basic: 基礎編、advanced: 応用編
  enum level: { entry: 0, basic: 1, advanced: 2 }
end
