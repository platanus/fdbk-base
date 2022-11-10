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
end
