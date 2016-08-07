class Setting
  include Mongoid::Document
  field :about, type: String
  field :blurb, type: String
  field :text, type: String
  field :pic, type: String
end
