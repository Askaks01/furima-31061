FactoryBot.define do
  factory :purchase_history_form do
    postal_code { '123-4567' }
    prefecture_id { 2 }
    city { '横浜市緑区' }
    house_num { '青山１−１−１' }
    building_name { '柳ビル１０３' }
    phone_num { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
