class Api::Internal::FeedbackSessionsController < Api::Internal::BaseController
  before_action :authenticate_user!

  def index
    sessions = if params[:type].present?
                 filtered_sessions
               else
                 FeedbackSession.for_user(current_user)
               end

    respond_with sessions.includes(:provider, :receiver)
  end

  private

  def filtered_sessions
    params[:type] === 'provider' ? current_user.providers : current_user.receivers
  end
end
