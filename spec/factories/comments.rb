FactoryBot.define do
  factory :comment do
    feedback_session { create(:feedback_session) }
    body { Faker::Lorem.sentence }
  end
end
