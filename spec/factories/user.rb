FactoryBot.define do
  factory :user, class: User do
    name { 'student' }
    email { 'hello123@gmail.com' }
    password { '123456' }
  end
end
