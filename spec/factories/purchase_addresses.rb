FactoryBot.define do
  factory :purchase_address do
    post_code {'123-4567'}
    prefecture_id {'2'}
    city {'千葉県市川市'}
    house_number {'平田1-1-1'}
    phone_number {'08012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
