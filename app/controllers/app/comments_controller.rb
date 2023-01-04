class App::CommentsController < App::BaseController
  def new
    @feedback_session = feedback_session
  end

  private

  def feedback_session
    @feedback_session ||= FeedbackSession.find(params[:feedback_session_id])
  end
end
