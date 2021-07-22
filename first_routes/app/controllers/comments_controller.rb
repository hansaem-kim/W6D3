class CommentsController < ApplicationController
    def index 
        if params.has_key?(:user_id)
            user = User.find(params[:user_id])
            render json: user.comments
        elsif params.has_key?(:artwork_id)
            artwork = Artwork.find(params[:artwork_id])
            render json: artwork.comments
        else
            render json: Comment.all
        end

    end

    def create
        comment = Comment.new(comment_params)

        if comment.save
            render json: comment
        else
            render json: Comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy 
        comment = Comment.find(params[:id])
        if comment.destroy 
            render json: comment 
        else
            render json: Comment.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

    def comment_params 
        params.require(:comment).permit(:commenter_id, :artwork_id, :body)  
    end
end