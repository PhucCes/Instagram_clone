FactoryBot.define do
  factory :post, class: Post do
    title { Faker::Lorem.sentence }
    image Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/public/apple-touch-icon.png')))
    association :user, factory: :user
  end

  factory :invalid_post, parent: :post do
    image nil
  end
end
