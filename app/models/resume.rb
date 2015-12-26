class Resume
  include Mongoid::Document
  include Mongoid::Paperclip
  include Mongoid::Timestamps

  field :url, type: String
  field :is_current, type: Boolean
  has_mongoid_attached_file :resume
  has_mongoid_attached_file :resume,
                            :url => "/resume/attachments/:id/:filename",
                            :path => ":rails_root/public/resume/attachments/:id/:filename"

  validates_attachment_presence :resume
  validates_attachment_size :resume, :less_than => 10.megabytes
  do_not_validate_attachment_file_type :resume

  # def url_thumb
  #   @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  # end

end
