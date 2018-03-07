class FriendshipsController < ApplicationController

    def create
        Friendship.create(:accept_friend_id => current_user.id, :sent_friend_id => params[:id])
        redirect_back fallback_location: { action: "show", id: params[:id] }
    end
    
    def destroy
        Friendship.find(params[:id]).destroy
        redirect_back fallback_location: { action: "show", id: params[:id] }
    end
    
end
