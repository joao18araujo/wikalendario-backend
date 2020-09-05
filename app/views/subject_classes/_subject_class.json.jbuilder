json.extract! subject_class, :id, :name
json.schedules subject_class.schedules, partial: "schedules/schedule", as: :schedule