FactoryBot.define do
  factory :user do
    email { 'sarah@email.com' }
    password { 'str0ngP@ss1' }
  end

  factory :location do
    name { 'freezer' }
  end
end
