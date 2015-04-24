FactoryGirl.define do
  factory :user do
    user_name "Richard"
    email "richard@example.com"
    phone_number 7088700000
    password "password"
    password_confirmation "password"
  end
end