Factory.define do

  factory :result do
    gi          "gi|BAD14874.1"
    score       "0.984722"
    job_id      "1"
    analysis_id "12"
  end

  factory :job do |j|
    name        "gProteins Alpha SVM"
  #  j.method      'svm'
    public      "true"
    genome      "Arabidopsis thaliana"
    user_id     "1"
  end
end