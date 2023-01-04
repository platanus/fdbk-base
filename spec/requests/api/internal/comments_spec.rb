require 'rails_helper'

RSpec.describe 'Api::Internal::CommentsControllers', type: :request do
  describe 'POST /create' do
    let(:user) { create(:user) }
    let(:feedback_session) { create(:feedback_session, provider:user) }


    let(:params) do
      {
        comment: {
          body: "cualquier cosa"
        }
      }
    end

    let(:attributes) do
      JSON.parse(response.body)['comment'].symbolize_keys
    end

    def perform
      post "/api/internal/feedback_sessions/#{feedback_session.id}/comments", params: params
    end

    before do
      sign_in(user)
      perform
    end

    it { expect {perform}.to change { Comment.count }.by(1) }
    it { expect(response.status).to eq(201) }
  end
end
