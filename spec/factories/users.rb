FactoryGirl.define do
  factory :user do
    user_name "Richard"
    email "richard@example.com"
    password "password"
    password_confirmation "password"
  end
end