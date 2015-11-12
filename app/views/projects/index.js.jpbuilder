json.cache! ['v1', @projects], expires_in: 10.minutes do
  json.array!(@projects.reverse!) do |project|
    json.extract! project, :title, :id, :banner, :archived, :thumbnail, :size, :tags, :date, :shortDescription
    json.url project_url(project, format: :json)
  end
end
