class Api::Internal::CommentsController < Api::Internal::BaseController
  before_action :authenticate_user!

  def create
    respond_with feedback_session.comments.create!(permitted_params)
  end

  private

  def permitted_params
    params.require(:comment).permit(:body)
  end

  def feedback_session
    @feedback_session ||= FeedbackSession.for_user(current_user).find(params[:feedback_session_id])
  end
end
