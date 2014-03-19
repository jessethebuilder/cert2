FactoryGirl.define do
  sequence(:name){ |n| "Name_#{n}"}
  sequence(:email){ |n| "test_#{n}@test.com"}

  factory :store do
    name
    phone Faker::PhoneNumber.phone_number
    email Faker::Internet.email
    minimum_certificate_amount Random.rand(1..2000)
  end

  factory :cert do
    amount Random.rand(0.0..100000.0)
    giver_identifier Faker::Lorem.characters(character_count = 30)
    giver_source Cert::SOURCES.sample

    receiver_identifier Faker::Lorem.characters(character_count = 30)
    receiver_source Cert::SOURCES.sample

    factory :received_cert do
      after(:build) do |cert, eval|
        cert.receiver = build :user
      end
    end
  end

  factory :user do
    name
    email
    password 'test8888'

    factory :admin do
      admin true
    end

    factory :opted_out_user do
      opt_out true
    end
  end

  factory :account do

  end

  factory :transaction do

  end


end
