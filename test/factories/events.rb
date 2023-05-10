FactoryBot.define do
  factory :event do
    name { "MyString" }
    location { "MyString" }
    date { "2023-05-10 15:03:39" }
    start_time { "2023-05-10 15:03:39" }
    end_time { "2023-05-10 15:03:39" }
    details { "MyText" }
    host { nil }
  end
end
