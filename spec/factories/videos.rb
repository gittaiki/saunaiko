FactoryBot.define do
  factory :video do
    sequence(:youtube_id, 'iTSsv7AZ8dw')
    address { '東京' }
    sauna { 'かるまる' }
  end
end
