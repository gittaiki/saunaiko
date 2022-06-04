class Watch < ApplicationRecord
  belongs_to :user
  belongs_to :video

  validates :user_id, uniqueness: { scope: :video_id }

  def self.total(user_id)
    where(user_id: user_id)
  end
end
