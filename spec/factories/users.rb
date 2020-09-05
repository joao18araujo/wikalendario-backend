FactoryBot.define do
  factory :user do
    name { "João" }
    nickname { "jv_araujo" }
    email { "joao18araujo@gmail.com" }
    password { "06bisonho" }
    course
  end
end
