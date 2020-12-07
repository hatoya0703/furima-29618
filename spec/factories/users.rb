FactoryBot.define do
  factory :user do
    nickname{"テスト"}
    email{Faker::Internet.free_email}
    password{"abcd1234"}
    password_confirmation{password}
    first_name{"苗字"}
    last_name{"名前"}
    kana_first_name{"ミョウジ"}
    kana_last_name{"ナマエ"}
    birth_date{"2000-01-01"}
  end
end