FactoryBot.define do
  factory :user do
    trait :user1 do
      email { "test@test.com" }
      password  { "password" }
      full_name { 'Test' }
      location { 'Chicago'}
    end

    trait :user2 do
      email { "test2@test.com" }
      password  { "password" }
      full_name { 'Test 2' }
      location { 'Chicago'}
    end
  end
end