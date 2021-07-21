class ArtworksController < ApplicationController

    def index 
        render json: Artwork.all 
    end

    def create
        artwork = Artwork.new(artwork_params)

        if artwork.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params) 
            render json: user 
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy 
        user = User.find(params[:id])
        if user.destroy 
            render json: user 
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

        def artwork_params 
            params.require(:artwork).permit(:title, :image_url, :artist_id)  
        end
end