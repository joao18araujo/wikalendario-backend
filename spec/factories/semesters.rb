FactoryBot.define do
  factory :semester do
    start_date { DateTime.now - 1.hour }
    end_date { DateTime.now + 1.hour }
    university

    trait :past_semester do
      start_date { DateTime.now - 2.hours }
      end_date { DateTime.now - 1.hour }

    end

    trait :future_semester do
      start_date { DateTime.now + 1.hour }
      end_date { DateTime.now + 2.hours }
    end
  end
end
