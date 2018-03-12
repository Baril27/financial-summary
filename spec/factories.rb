FactoryBot.define do
  factory :user do
    email { FFaker::Internet.safe_email }
  end

  factory :transaction do
    amount { Money.from_amount(1, :usd) }
    category { %i(deposit withdraw refund).sample }
    association :user
  end

  factory :wallet do
    balance { Money.from_amount(0, :usd) }
    association :user
  end
end
