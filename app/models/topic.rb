class Topic < ActiveRecord::Base
	belongs_to :user
	has_many :reviews
	validates :title, presence: true,
						length: {minimum: 5}

	mount_uploader :image, ImageUploader
	mount_uploader :video, VideoUploader
	mount_uploader :attachment, AttachmentUploader 

	def self.search(search)
		if search 
			where(["title LIKE ?","%#{search}%"])
		else
			all 
	end
end
end 
