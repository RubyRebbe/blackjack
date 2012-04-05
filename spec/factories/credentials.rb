# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :credential do
    name "MyString"
    password "MyString"
    user nil
  end
end
