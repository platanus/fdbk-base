require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'Validations' do
    subject(:user) { build(:user) }

    it { expect(user).to validate_presence_of(:name) }
  end

  describe 'Associations' do
    subject(:user) { build(:user) }

    it do
      expect(user).to(
        have_many(:providers).class_name('FeedbackSession')
                             .with_foreign_key('provider_id')
                             .dependent(:nullify)
      )
    end

    it do
      expect(user).to(
        have_many(:receivers).class_name('FeedbackSession')
                             .with_foreign_key('receiver_id')
                             .dependent(:nullify)
      )
    end
  end
end
