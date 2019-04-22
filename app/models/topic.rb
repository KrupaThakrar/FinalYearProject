class Topic < ActiveRecord::Base
	acts_as_votable
	belongs_to :user
	has_many :reviews
	has_many :appointment
	has_many :resumes
	validates :title, presence: true,
						length: {minimum: 5}
	validates :body, presence: true,
						length: {minimum: 10}
	validates :image, presence: true


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
