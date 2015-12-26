json.array!(@resumes) do |resume|
  json.extract! resume, :url, :type
  json.url resume_url(resume, format: :json)
end
