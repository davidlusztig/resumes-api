json.array! @resumes do |resume|
    json.extract! resume, :id, :function, :job_description
  end
  