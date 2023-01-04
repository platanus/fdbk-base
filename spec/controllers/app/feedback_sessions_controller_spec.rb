require 'rails_helper'

RSpec.describe App::FeedbackSessionsController, type: :controller do
  let(:user) { create(:user) }
  let(:feedback_session) { create(:feedback_session, receiver: user) }

  describe "GET #index" do
    before do
      sign_in(user)
      perform
    end

    def perform
      get :index
    end

    it 'returns a success code' do
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    before do
      sign_in(user)
      perform
    end

    def perform
      get :show, params: { id: feedback_session.id }
    end

    it 'returns a success code' do
      expect(response.status).to eq(200)
    end
  end
end
