FactoryBot.define do
  factory :user do
    nickname              {"furima太郎"}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"陸太郎"}
    last_kana             {"ヤマダ"}
    first_kana            {"リクタロウ"}
    birthday              {"1930-01-01"}
  end
end