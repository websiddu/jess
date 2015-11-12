class Art
  include Mongoid::Document
  field :name, type: String
  field :date, type: Date
  field :content, type: String
  field :preview, type: String
  field :preview_thumb, type: String
  field :votes, type: Integer, default: 0
  field :sequence, type: Integer, default: 0
  field :views, type: Integer, default: 0
  field :source, type: String
  field :tags, type: String
  field :attachment, type: String
  field :colors, type: Array
  def self.archived
    where(archived: 'true')
  end
  def self.active
    where(archived: 'false')
  end

end
