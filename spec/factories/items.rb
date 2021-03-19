FactoryBot.define do
  factory :item do
    name               { Faker::Lorem.sentence }
    describe           { Faker::Lorem.sentence }
    price              { Faker::Number.number(digits: 5) }
    category_id        { Faker::Number.between(from: 2, to: 11) }
    item_condition_id  { Faker::Number.between(from: 2, to: 7) }
    shipping_charge_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    delivery_time_id   { Faker::Number.between(from: 2, to: 4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpeg'), filename: 'test.jpeg')
    end
  end
end
