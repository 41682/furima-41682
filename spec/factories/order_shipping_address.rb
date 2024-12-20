FactoryBot.define do
  factory :order_shipping_address do
    token                {'tok_abcdefghijk00000000000000000'}
    postal_code          {'123-4567'}
    prefecture_id        {rand(2..48)}
    city                 {Faker::Address.city}
    addresses            {Faker::Address.street_address}
    building             {Faker::Address.secondary_address}
    phone_number         {Faker::Number.leading_zero_number(digits: 11)}
  end
end
