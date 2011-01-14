Factory.define :result do |r|
  r.gi          "gi|BAD14874.1"
  r.score       "0.984722"
  r.job_id      "1"
  r.analysis_id "12"
end

Factory.define :job do |j|
  j.name        "gProteins Alpha SVM"
  #j.method      'svm'
  j.public      "true"
  j.genome      "Arabidopsis thaliana"
  j.user_id     "1"
end
  
Factory.define :user do |u|
  u.name                    "Michael Hartl"
  u.email                   "mhart1@example.com"
  u.password                "foobar"
  u.password_confirmation   "foobar"
end  