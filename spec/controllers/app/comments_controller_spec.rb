require 'rails_helper'

RSpec.describe App::CommentsController, type: :controller do
  let(:user) { create(:user) }
  let(:feedback_session) { create(:feedback_session, receiver: user) }

  describe "GET #new" do
    before do
      sign_in(user)
      perform
    end

    def perform
      get :new, params: { feedback_session_id: feedback_session.id }
    end

    it 'returns a success code' do
      expect(response.status).to eq(200)
    end
  end
end
