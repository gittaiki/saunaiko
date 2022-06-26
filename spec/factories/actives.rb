FactoryBot.define do
  factory :active do
    visited_on { Time.zone.today }
    sauna_minute { 1 }
    water_bath_minute { 1 }
    break_minute { 1 }
    cycle_count { 1 }
    association :user
  end
end
