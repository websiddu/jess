json.extract! @project, :title, :sequence, :votes, :projectUrl, :isActive, :description, :size, :shortDescription, :skills, :thumbnail, :banner, :screenshots, :tags, :date

json.nextProject Project.where({:sequence => @project.sequence+1}).sort({:_id=>1}).first
json.previousProject Project.where({:sequence => @project.sequence-1}).sort({:_id=>1}).first

# json.cache! ['v1', @project], expires_in: 10.minutes do
#  json.extract! @project, :title, :projectUrl, :isActive, :description, :shortDescription, :skills, :thumbnail, :banner, :screenshots, :tags, :date
# end
