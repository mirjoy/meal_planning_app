FactoryGirl.define do
  factory :user do
    user_name "Richard"
    email "richard@example.com"
    password "password"
    provider "Facebook"
  end
end