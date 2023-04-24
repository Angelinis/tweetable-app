module Api

  class Api::TweetsController < ApiController
    def index
      @tweets = Tweet.all
      render json: @tweets, status: :ok
    end

    def show
      @tweet = Tweet.find_by(id: params[:id])
      if @tweet
        render json: {all_data: {tweet: @tweet, replies: @tweet.replies}}, status: :ok
      else 
        render json: {}, status: :not_found
      end
    end

  end
end