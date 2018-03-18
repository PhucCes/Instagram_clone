require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { FactoryBot.build(:comment) }

  describe 'validation' do
    context 'invalid attributes' do
      subject { FactoryBot.build :invalid_comment }
      it { expect(subject).to be_invalid }
    end

    it 'valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe 'association' do
    it 'belongs to user' do
      relation = described_class.reflect_on_association(:user)
      expect(relation.macro).to eq :belongs_to
    end

    it 'belongs to post' do
      relation = described_class.reflect_on_association(:post)
      expect(relation.macro).to eq :belongs_to
    end
  end
end
