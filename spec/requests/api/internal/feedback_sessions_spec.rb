require 'rails_helper'

RSpec.describe 'Api::Internal::FeedbackSessionsControllers', type: :request do
  let(:user) { create(:user) }

  describe 'GET /index' do
    let!(:feedback_sessions) { create_list(:feedback_session, 5) }
    let(:collection) { JSON.parse(response.body)['feedback_sessions'] }
    let(:params) { {} }

    def perform
      get '/api/internal/feedback_sessions', params: params
    end

    context 'with authorized user' do
      before do
        sign_in(user)
        perform
      end

      it { expect(collection.count).to eq(5) }
      it { expect(response.status).to eq(200) }
    end

    context 'with unauthenticated user' do
      before { perform }

      it { expect(response.status).to eq(401) }
    end
  end
end
