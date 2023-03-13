FactoryBot.define do
  factory :user do
    email { "test@test.com" }
    password  { "password" }
    full_name { 'Test' }
    location { 'Chicago'}
  end
end