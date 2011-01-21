Factory.define :result do |r|
  r.gi          "BAD14874.1"
  r.score       "0.984722"
  r.job_id      "1"
  r.analysis_id "12"
end

Factory.define :job do |j|
  j.name        "gProteins Alpha SVM"
  #j.method      'svm'
  j.public      "true"
  j.genome      "Arabidopsis thaliana"
  j.association :user
end
  
Factory.define :user do |u|
  u.name                    "New Name"
  u.email                   "user@example.org"
  u.password                "foobar"
  u.password_confirmation   "foobar"
end  

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :program do |p|
  p.name      "SVM"
  p.location  "/sw/bin/svm-train"
end