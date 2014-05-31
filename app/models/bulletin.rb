class Bulletin < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }

  mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.
  validates :name, presence: true # Make sure the owner's name is present.
  validates :attachment, presence: true

end
