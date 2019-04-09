class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include Pundit

  add_flash_types :error, :notice, :warning, :alert, :success

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def find_one(model, redirect_url)
    begin
      model.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
      respond_to do |format|
        format.html { redirect_to redirect_url, error: error }
        format.json { render json: { error: error }, status: :not_found }
      end
    end
  end

  private

  def user_not_authorized
    flash[:alert] = 'You are not authorized to perform this action.'
    respond_to do |format|
      format.html { redirect_to request.referrer || root_path, error: 'You are not authorized to perform this action.' }
      format.json { render json: { error: 'Not Authorized' }, status: :forbidden }
    end
  end

end
