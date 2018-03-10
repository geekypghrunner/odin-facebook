class LikesController < ApplicationController
    
    def create
        @like = Like.create(:user_id => params[:user], :post_id => params[:post])
        redirect_back fallback_location: { action: "show", id: params[:id] }
    end
    
    def destroy
        Like.find(params[:id]).destroy
        redirect_back fallback_location: { action: "show", id: params[:id] }
    end
    
end
