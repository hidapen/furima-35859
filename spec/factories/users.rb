FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'111aaa'}
    password_confirmation {password}
    first_name            {'松のエ'}
    last_name             {'美チこ'}
    first_name_furigana   {'マツノエ'}
    last_name_furigana    {'ミチコ'}
    birthday              {Faker::Date.birthday}
  end
end