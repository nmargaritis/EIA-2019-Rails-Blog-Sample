class ArticlesController < ApplicationController
    before_action :logged_in_user, only: [:new, :create, :update, :destroy]
    before_action :ensure_authorization
    before_action :set_article, only: [:show, :destroy, :update]
    after_action :verify_authorized

    def index
        @articles = Article.all
        respond_to do |format|
            format.html
            format.json { render json: @articles }
        end
    end

    def show
        respond_to do |format|
            format.html # show.html.erb
            format.json { render json: @article }
        end
    end

    def new
    end

    def create

        @article = Article.new(params.require(:article).permit(:title, :text, :author_id))
        @article.save
        redirect_to @article
    end

    def update
        respond_to do |format|
          if @article.update(params.require(:article).permit(:title, :text, :author_id))
            format.html { redirect_to @article, success: 'article was successfully updated.' }
            format.json { render :show, status: :ok, location: @article }
          else
            format.json { render json: @article.errors, status: :bad_request }
          end
        end
    end

    def destroy
        @article.destroy
        respond_to do |format|
          format.html { redirect_to articles_url }
          format.json { head :no_content }
        end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
        @article = find_one(Article, articles_url)
    end

    def ensure_authorization
      authorize Article
    end

end
