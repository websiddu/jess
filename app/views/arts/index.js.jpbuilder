json.array!(@arts.reverse!) do |art|
  json.extract! art, :name, :content, :id, :preview, :preview_thumb, :source, :date, :views, :votes, :tags, :sequence
  json.url art_url(art, format: :json)
end
