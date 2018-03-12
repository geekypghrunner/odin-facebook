class PostsController < ApplicationController
    
    def create
        @post = Post.create(:user_id => params[:post][:user_id], :author_id => params[:post][:author_id], :content => params[:post][:content])
        redirect_back fallback_location: { action: "show", id: params[:id] }
    end
    
    def index
        @friends = FriendRequest.where("sender_id = ?", current_user.id).or(Post.where("recipient_id = ?", current_user.id)).where("accept = true")
        @friend_list = []
        @friends.each do |f|
            @friend_list.push(f.sender_id)
            @friend_list.push(f.recipient_id)
        end
        @friend_list_time = []
        @friend_list.uniq.each do |f|
            User.find(f).posts.each do |p|
                @friend_list_time.push(p.created_at)
            end
        end
        @friend_list_time.sort!.reverse!
        
    end
    
end
