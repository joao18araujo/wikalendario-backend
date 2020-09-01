json.extract! university, :id, :name
json.campi university.campi
json.current_semester university.current_semester, partial: 'semesters/semester', as: :semester