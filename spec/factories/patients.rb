FactoryBot.define do
  factory :patient do
    first_name { "MyString" }
    last_name { "MyString" }
    identification { "MyString" }
    gender { "MyString" }
    birthdate { "2019-06-28" }
    blood_type_rh { "MyString" }
  end
end
