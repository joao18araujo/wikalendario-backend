json.extract! campus, :id, :name
json.courses campus.courses, partial: "courses/course", as: :course
json.departments campus.departments, partial: "departments/department", as: :department