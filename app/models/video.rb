class Video < ApplicationRecord
  with_options presence: true do
    validates :youtube_id
    validates :address
    validates :sauna
  end

  validates :youtube_id, uniqueness: true
end
