FactoryBot.define do
  factory :video do
    sequence(:youtube_id, 'yid_1')
    address { 'tokyo' }
    sauna { 'karumaru' }
  end
end
