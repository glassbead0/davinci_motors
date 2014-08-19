# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    date_of_birth "2014-08-18"
    eye_color "MyString"
    first_name "MyString"
    middle_name "MyString"
    last_name "MyString"
    hair_color "MyString"
    height "MyString"
    sex "MyString"
    weight "MyString"
  end
end
