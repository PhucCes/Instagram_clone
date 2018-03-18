require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { FactoryBot.build(:post) }

  describe 'validation' do
    context 'invalid attributes' do
      subject { FactoryBot.build :invalid_user }
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

    it 'has many likes' do
      relation = described_class.reflect_on_association(:likes)
      expect(relation.macro).to eq :has_many
    end

    it 'has many comments' do
      relation = described_class.reflect_on_association(:comments)
      expect(relation.macro).to eq :has_many
    end
  end
end
