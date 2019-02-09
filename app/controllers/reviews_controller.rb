class ReviewsController < ApplicationController
  before_action :authenticate_user! 
  before_action :find_book
  before_action :find_review, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit]
  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.topic_id = @topic.id

    respond_to do |format|
      if @review.save
        format.html { redirect_to @topic, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    if @review.update(review_params)
      redirect_to topic_path(@topic), notice: 'Review was successfully updated.'
    else
      render 'edit'
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    redirect_to topic_path(@topic), notice: 'Review was successfully deleted.'
  end

  private
  def review_params
        params.require(:review).permit(:rating, :comment)
      end

      def find_book
        @topic = Topic.find(params[:topic_id])
      end

      def find_review
        @review = Review.find(params[:id])
      end
  end
