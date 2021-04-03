FactoryBot.define do
  factory :delivery_purchase do
    postal_code   { '111-1111' }
    prefecture_id { 2 }
    municipality  { '某市' }
    house_number  { '某1丁目' }
    building      { nil }
    phone_number  { 11111111111 }
    token         {"tok_abcdefghijk00000000000000000"}  
  end
end
