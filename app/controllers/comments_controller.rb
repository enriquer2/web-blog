class CommentsController < ApplicationController
    http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

    before_action :set_comment, only: [:destroy]

    def create
        @comment = Comment.new(comment_params)
        respond_to do |format|
            if @comment.save
                format.html { redirect_to @comment.article, notice: 'comment was successfully created.' }
            else
                format.html { render :new }
            end
        end
    end

    def destroy
        @comment.destroy
        respond_to do |format|
            format.html { redirect_to @comment.article, notice: 'comment was successfully destroyed.' }
        end
    end
 
    private
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def comment_params
        params.require(:comment).permit(:commenter, :body, :score, :article_id)
    end
end
