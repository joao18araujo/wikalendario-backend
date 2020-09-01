json.extract! department, :id, :name
json.subjects department.subjects, partial: "subjects/subject", as: :subject
