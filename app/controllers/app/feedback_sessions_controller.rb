class App::FeedbackSessionsController < App::BaseController
  def index
    @provider_sessions = current_user.providers.includes(:provider, :receiver)
  end

  def show
    @feedback_session = feedback_session
    @comments = feedback_session.comments
  end

  private

  def feedback_session
    @feedback_session ||= FeedbackSession.find(params[:id])
  end
end
