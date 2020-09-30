json.extfunction! @resume, :id, :function, :job_description
json.comments @resume.comments do |comment|
  json.extract! comment, :id, :content
  json.user do
    json.id comment.user.id
    json.email comment.user.email
  end
end