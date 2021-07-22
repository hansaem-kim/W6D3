class ArtworksController < ApplicationController

    def index 

        if params.has_key?(:user_id)
            user = User.find(params[:user_id])
            render json: {
                artworks: user.artworks,
                artwork_shares: user.artwork_shares
            }
        else
            render json: Artwork.all 
        end

    end

    def create
        artwork = Artwork.new(artwork_params)

        if artwork.save
            render json: artwork
        else
            render json: Artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        render json: Artwork.find(params[:id])
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params) 
            render json: artwork 
        else
            render json: Artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy 
        artwork = Artwork.find(params[:id])
        if artwork.destroy 
            render json: artwork 
        else
            render json: Artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

        def artwork_params 
            params.require(:artwork).permit(:title, :image_url, :artist_id)  
        end
end