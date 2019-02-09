class TopicsController < ApplicationController
    #before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
    before_action :find_topic, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:show, :index, :update, :destroy]
	
	def index
		@topics = Topic.search(params[:search]).paginate(:page => params[:page], :per_page => 3)
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
		#render plain: params[:post].inspect
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
		redirect_to topics_path
	end

	private 

	def topic_params
		params.require(:topic).permit(:topic_id, :title, :body, :date, :image, :remove_image, :video, :attachment)
	end

	def find_topic
			@topic = Topic.find(params[:id])
	end
end
