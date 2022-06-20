class Active < ApplicationRecord
  belongs_to :user

  with_options presence: true do
    validates :visited_on
    validates :sauna_minute
    validates :water_bath_minute
    validates :break_minute
    validates :cycle_count
    validates :score
  end
end
