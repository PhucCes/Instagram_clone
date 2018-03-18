FactoryBot.define do
  factory :comment, class: Comment do
    association :user, factory: :user
    association :post, factory: :post
    content     Faker::Lorem.characters(10)
  end

  factory :invalid_comment, parent: :comment do
    content Faker::Lorem.characters(400)
  end
end
