class TopicsController < ApplicationController
    #before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
    before_action :find_topic, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:show, :index, :update, :destroy]
	before_action :set_topic, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
	
	def index
	 #if params[:search].present?
	    @topics = Topic.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
	  #else
          #flash[:success] = "No result found"
	  #end
	end

	def show
		@topic = Topic.find(params[:id])
		@reviews = Review.where(topic_id: @topic.id).order("created_at DESC")
		if @topic.reviews.blank?
		   @average_review = 0
		else
	    @average_review = @topic.reviews.average(:rating).round(2)
	end
	end 

	def new
		@topic = Topic.new
	end

	def create
		@topic = current_user.topics.build(topic_params)
		if (@topic.save)
			redirect_to @topic, notice: "This topic #{@topic.title} has been uploaded."
		else
			render 'new'
		end 
	end	

	def edit
		@topic = Topic.find(params[:id])
	end 

	def update
	    if @topic.update(topic_params)
			redirect_to topic_path(@topic), notice: "This topic #{@topic.title} has been updated."
		else
			render 'edit'
		end 
	end

	def destroy
		@topic = Topic.find(params[:id])
		@topic.destroy
		redirect_to topics_path, notice: 'Topic was successfully deleted.'
	end

	def upvote
	@topic.upvote_from current_user
	redirect_to topics_path
	end 

	def downvote
	@topic.downvote_from current_user
	redirect_to topics_path
	end 

	private 

	def topic_params
		params.require(:topic).permit(:topic_id, :title, :body, :date, :image, :remove_image, :video, :attachment)
	end

	def find_topic
	    @topic = Topic.find(params[:id])

	end

	def set_topic
		@topic = Topic.find(params[:id])
	end
end
