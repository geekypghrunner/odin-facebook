class UsersController < ApplicationController
    
    def index
        @users = User.all
    end
    
    def show
        @user = User.find(params[:id])
        if FriendRequest.where("sender_id = ? AND recipient_id = ?", params[:id], current_user.id).any?
            @request = FriendRequest.where("sender_id = ? AND recipient_id = ?", params[:id], current_user.id)
        elsif FriendRequest.where("sender_id = ? AND recipient_id = ?", current_user.id, params[:id]).any?
            @request = FriendRequest.where("sender_id = ? AND recipient_id = ?", current_user.id, params[:id])
        end
        @post = Post.new
        @posts = @user.posts
        @like = Like.new
    end
    
    
end
