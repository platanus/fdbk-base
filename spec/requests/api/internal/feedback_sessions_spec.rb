require 'rails_helper'

RSpec.describe 'Api::Internal::FeedbackSessionsControllers', type: :request do
  let(:user) { create(:user) }

  describe 'GET /index' do
    let(:collection) { JSON.parse(response.body)['feedback_sessions'] }
    let(:params) { {} }

    before do
      create_list(:feedback_session, 5)
      create_list(:feedback_session, 2, receiver: user)
      create_list(:feedback_session, 1, provider: user)
    end

    def perform
      get '/api/internal/feedback_sessions', params: params
    end

    context 'with authorized user' do
      before do
        sign_in(user)
        perform
      end

      it { expect(collection.count).to eq(3) }
      it { expect(response.status).to eq(200) }
    end

    context 'with unauthenticated user' do
      before { perform }

      it { expect(response.status).to eq(401) }
    end
  end
end
