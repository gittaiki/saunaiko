class Video < ApplicationRecord
  validates :youtube_id, presence: true

  # basic: 基礎編、advanced: 応用編
  enum level: { bacic: 0, advanced: 1 }
end
