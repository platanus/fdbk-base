require 'rails_helper'

RSpec.describe FeedbackSession, type: :model do
  it 'has a valid factory' do
    expect(build(:feedback_session)).to be_valid
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:session_date) }
  end

  describe 'Associations' do
    subject(:feedback_session) { build(:feedback_session) }

    it { expect(feedback_session).to belong_to(:provider).class_name('User') }
    it { expect(feedback_session).to belong_to(:receiver).class_name('User') }
  end

  describe 'Scopes' do
    describe '#for_user' do
      let(:user) { create(:user) }
      let!(:feedback_sessions) { create_list(:feedback_session, 5) }
      let!(:receiver_feedback_sessions) { create_list(:feedback_session, 2, receiver: user) }
      let!(:provider_feedback_sessions) { create_list(:feedback_session, 2, provider: user) }
      let(:user_sessions) { receiver_feedback_sessions + provider_feedback_sessions }

      it 'returns feedback sessions for user' do
        expect(described_class.for_user(user)).to match_array(user_sessions)
      end
    end
  end
end
