json.extract! campus, :id, :name
json.courses campus.courses, partial: "courses/course", as: :course