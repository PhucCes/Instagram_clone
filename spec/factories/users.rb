FactoryBot.define do
  factory :user, class: User do
    user_name   { Faker::Name.initials(8)  }
    email       { Faker::Internet.email }
    password    { Faker::Internet.password(8) }
  end

  factory :invalid_user, parent: :user do
    email nil
  end
end
