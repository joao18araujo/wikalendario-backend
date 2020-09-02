json.extract! subject, :id, :name
json.subject_classes subject.subject_classes, partial: "subject_classes/subject_class", as: :subject_class