class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @idea = Idea.find(params[:idea_id])
    @comments = @idea.comments.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @idea = Idea.find(params[:idea_id])
    @comments = @idea.comments.find(params[:id])
  end

  # GET /comments/new
  def new
    @idea = Idea.find(params[:idea_id])
    @comment = @idea.comments.build
  end

  # GET /comments/1/edit
  def edit
    @idea = Idea.find(params[:idea_id])
    @comment = @idea.comments.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @idea = Idea.find(params[:idea_id])
    @comment = @idea.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html {redirect_to request.referer, notice: 'Comment was successfully created.'}
        format.json {render :show, status: :created, location: @comment}
      else
        format.html {render :new}
        format.json {render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html {redirect_to @comment.idea, notice: 'Comment was successfully updated.'}
        format.json {render :show, status: :ok, location: @comment}
      else
        format.html {render :edit}
        format.json {render json: @comment.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @idea = Idea.find(params[:idea_id])
    @comment.destroy

    respond_to do |format|
      format.html {redirect_to idea_comments_url, notice: 'Comment was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:user_name, :body, :idea_id)
  end
end
