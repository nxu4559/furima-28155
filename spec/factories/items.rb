FactoryBot.define do
  factory :item do
    name { Faker::Team.name }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    postage_prayer_id { 2 }
    prefecture_id { 2 }
    days_id { 2 }
    price { 300 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
