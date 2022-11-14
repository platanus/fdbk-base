class Api::Internal::FeedbackSessionsController < Api::Internal::BaseController
  before_action :authenticate_user!

  def index
    respond_with FeedbackSession.for_user(current_user)
  end
end
