FactoryBot.define do
  factory :activity do
    broker
    deal
    title { "Call #{deal.contact.full_name}" }
    description { "He said he was busy and that he will call me back" }
    due_date { Time.current }
    completion_date { [nil, 1.week.from_now].sample }
  end
end
