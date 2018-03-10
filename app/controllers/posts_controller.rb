class PostsController < ApplicationController
    
    def create
        @post = Post.create(:user_id => params[:post][:user_id], :author_id => params[:post][:author_id], :content => params[:post][:content])
        redirect_back fallback_location: { action: "show", id: params[:id] }
    end
    
end
