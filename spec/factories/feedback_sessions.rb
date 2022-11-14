FactoryBot.define do
  factory :feedback_session do
    provider { association :user }
    receiver { association :user }
    session_date { Date.current + [*1..30].sample.days }
  end
end
