module Ideas
  class LikesController < ApplicationController

    def show
      @idea = Idea.find(params[:idea_id])
      @idea_like = @idea.idea_likes.all
    end

    def create
      @idea = Idea.find(params[:idea_id])
      @idea_like = @idea.idea_likes.build(user: current_user)

      respond_to do |format|
        if @idea_like.save
          format.html {redirect_to @idea, notice: 'Idea was successfully liked.'}
          format.json {render :show, status: :created, location: @idea_like}
        else
          format.html {redirect_to @idea, alert: @idea_like.errors.full_messages.join('\n')}
          format.json {render json: @idea_like.errors, status: :unprocessable_entity}
        end
      end
    end

    def destroy
      @idea = Idea.find(params[:idea_id])
      @idea.idea_likes.where(user: current_user).destroy_all

      respond_to do |format|
        format.html {redirect_to @idea, notice: 'Idea was successfully unliked.'}
        format.json {head :no_content}
      end
    end


  end
end