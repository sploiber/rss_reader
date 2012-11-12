FactoryGirl.define do
  factory :user do
    first_name "Shawn"
    last_name "Colvin"
    login "cover_girl"
    email 'shawn@larryklein.com'
    password "please"
    password_confirmation "please"
    confirmed_at Time.now
  end
end
