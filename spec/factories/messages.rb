FactoryBot.define do
  factory :message do
    body Faker::Lorem.sentence
    image File.open("#{Rails.root}/public/images/dog.png")
    user
    group
  end
end
