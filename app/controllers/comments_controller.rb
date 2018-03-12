class CommentsController < ApplicationController
    
    def create
        @comment = Comment.create(:post_id => params[:comment][:post_id], :user_id => params[:comment][:user_id], :content => params[:comment][:content])
        redirect_back fallback_location: { action: "show", id: params[:id] }
    end
    
    def update
    end
    
    def destroy
    end
    
end
