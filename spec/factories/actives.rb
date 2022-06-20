FactoryBot.define do
  factory :active do
    visited_on { '2022-06-19 10:56:26' }
    sauna_minute { 1 }
    water_bath_minute { 1 }
    break_minute { 1 }
    cycle_count { 1 }
    user { nil }
  end
end
