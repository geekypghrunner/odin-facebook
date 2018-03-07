class FriendRequestsController < ApplicationController
    
    def create
        FriendRequest.create(:sender_id => current_user.id, :recipient_id => params[:id], :accept => false)
        redirect_back fallback_location: { action: "show", id: params[:id] }
    end
    
    def destroy
        FriendRequest.find(params[:id]).destroy
        redirect_back fallback_location: { action: "show", id: params[:id] }
    end
    
    def update
        FriendRequest.update(params[:id],:accept => true)
        redirect_back fallback_location: { action: "show", id: params[:id] }
    end
    
end
