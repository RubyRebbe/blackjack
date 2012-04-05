# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :card do
    rank "MyString"
    suit "MyString"
    user_game nil
  end
end
