class Project
  include ProjectsHelper
  include Mongoid::Document
  include Mongoid::Taggable
  field :title
  field :projectUrl
  field :date, type: Date
  field :isActive, type: Mongoid::Boolean, default: true
  field :description
  field :shortDescription
  field :skills, type: Array
  field :size
  field :views, type: Integer, default: 0
  field :votes, type: Integer, default: 0
  field :sequence, type: Integer, default: 0
  field :thumbnail
  field :banner
  field :screenshots
  field :archived, type: Mongoid::Boolean, default: false
  field :views, type: Integer, default: 0
  def self.archived
    where(archived: 'true')
  end
  def self.active
    where(archived: 'false')
  end

  before_save :updated_images

  protected
  def updated_images
    self.description = updateImageSizes(self.description)
  end
end
