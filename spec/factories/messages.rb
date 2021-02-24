FactoryBot.define do
  factory :message do
    body {'hello'}
    conversation
    user
  end
end
