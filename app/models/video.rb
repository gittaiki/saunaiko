class Video < ApplicationRecord
  has_many :watches, dependent: :destroy
  has_many :users, through: :watches

  with_options presence: true do
    validates :youtube_id
    validates :address
    validates :sauna
  end

  validates :youtube_id, uniqueness: true
end
