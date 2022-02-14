class Video < ApplicationRecord
  has_many :watches, dependent: :destroy
  has_many :watch_users, through: :watches, source: :user
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_users, through: :bookmarks, source: :user

  with_options presence: true do
    validates :youtube_id
    validates :address
    validates :sauna
  end

  validates :youtube_id, uniqueness: true
end
