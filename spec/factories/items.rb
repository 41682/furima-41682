FactoryBot.define do
  factory :item do
    name                   {Faker::Commerce.product_name}
    info                   {Faker::Lorem.paragraph}
    category_id            {rand(2..10)}
    sales_status_id        {rand(2..6)}
    shipping_fee_status_id {rand(2..3)}
    prefecture_id          {rand(2..48)}
    scheduled_delivery_id  {rand(2..7)}
    price                  {rand(300..9_999_999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
