FactoryBot.define do
  factory :notification do
    user { nil }
    notifiable { nil }
    notifiable_type { "MyString" }
  end
end
