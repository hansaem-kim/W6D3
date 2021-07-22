class ArtworkSharesController < ApplicationController

    # def index 
    #     render json: ArtworkShare.all 
    # end

    def create
        artwork_share = ArtworkShare.new(artwork_share_params)

        if artwork_share.save
            render json: artwork_share
        else
            render json: ArtworkShare.errors.full_messages, status: :unprocessable_entity
        end
    end

    # def show
    #     render json: ArtworkShare.find(params[:id])
    # end

    # def update
    #     artwork_share = ArtworkShare.find(params[:id])
    #     if artwork_share.update(artwork_share_params ) 
    #         render json: artwork_share
    #     else
    #         render json: ArtworkShare.errors.full_messages, status: :unprocessable_entity
    #     end
    # end

    def destroy 
        artwork_share = ArtworkShare.find(params[:id])
        if artwork_share.destroy 
            render json: artwork_share
        else
            render json: ArtworkShare.errors.full_messages, status: :unprocessable_entity
        end
    end

    private

        def artwork_share_params 
            params.require(:artwork_share).permit(:artwork_id, :viewer_id)  
        end
end