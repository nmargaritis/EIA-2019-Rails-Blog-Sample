class AuthorsController < ApplicationController
    before_action :logged_in_user
    before_action :ensure_authorization
    before_action :set_author, only: [:destroy]
    after_action :verify_authorized

    def index
        @authors = Author.all
        respond_to do |format|
            format.html
            format.json { render json: @authors }
        end
    end

    def show; end

    def destroy
        @author.destroy
        respond_to do |format|
          format.html { redirect_to authors_url }
          format.json { head :no_content }
        end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_author
        @author = find_one(Author, authors_url)
    end

    def ensure_authorization
        authorize Author
    end
end
