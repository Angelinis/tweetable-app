class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy add_like remove_like]
  after_action :verify_authorized, only: %i[ update destroy]

  # GET /tweets
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  def show
    @replies = @tweet.replies
    #@replied_to = @tweet

  end


  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets/1/
  def create

    if params[:tweet_id]
      @replied_to = Tweet.find_by(id: params[:tweet_id])
    end

    @tweet = Tweet.new(tweet_params)
    #@tweet.replied_to = replied_to

    if current_user
      @tweet.user = User.find_by(id: current_user.id)
    end

    @tweet.replied_to = @replied_to

    
    
    if @tweet.save && @replied_to
      redirect_to @replied_to, notice: "Tweet was successfully created."
    elsif @tweet.save  
      redirect_to @tweet, notice: "Tweet was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweets/1
  def update
    authorize @tweet
    if @tweet.update(tweet_params)
      redirect_to @tweet, notice: "Tweet was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet.destroy
    redirect_to tweets_url, notice: "Tweet was successfully destroyed."
  end

  def remove_like
    @tweet.likes.destroy_by(user_id: current_user.id)
    redirect_back_or_to '/', notice: "Like was successfully destroyed.", status: :see_other
  end

  def add_like
    @tweet.likes.create(user_id: current_user.id)
    redirect_back_or_to '/', notice: "Like was successfully created."
    #There is an error when adding the status
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:body, :replied_to_id)
    end
end
