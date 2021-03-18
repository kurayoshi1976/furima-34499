FactoryBot.define do
  factory :item do
    name               { 'test' }
    describe           { 'test' }
    price              { 100 }
    category_id        { 1 }
    item_condition_id  { 1 }
    shipping_charge_id { 1 }
    prefecture_id      { 1 }
    delivery_time_id   { 1 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpeg'), filename: 'test.jpeg')
    end
  end
end
