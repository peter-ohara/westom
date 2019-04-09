FactoryBot.define do
  factory :milestone do
    title { "#{target} by #{due_date}" }
    start_date { Faker::Date.between(5.years.ago, Date.today) }
    due_date { [start_date + 1.month, start_date + 3.months, start_date + 1.year].sample }
    description { Faker::GreekPhilosophers.quote }
    target_type { [0, 1, 2, 3, 4, 5].sample }
    target do
      if target_type == 0
        rand(2000...1000_000)
      else
        rand(5...20)
      end
    end
    department { [0, 1, 2].sample }
    status { [0, 1].sample }
  end
end
