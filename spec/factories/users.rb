FactoryGirl.define do

  factory :user do
    login "UserName"
    email "example@example.com"
    first_name "first_name"
    last_name "last_name"
    middle_name "middle_name"
    password "password"
  end

end