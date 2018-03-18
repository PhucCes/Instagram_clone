require 'rails_helper'

RSpec.describe User, type: :model do

  subject { FactoryBot.build(:user) }

  describe 'validation' do
    context 'invalid attributes' do
      subject { FactoryBot.build :invalid_user }
      it { expect(subject).to be_invalid }
    end

    it 'valid attributes' do
      expect(subject).to be_valid
    end
  end

  describe 'functions' do
    before do
      subject.email = subject.email.upcase
      subject.save
    end

    it '.downcase_email' do
      expect(subject.email).to eq subject.email.downcase
    end

    it '#like?' do

    end
  end

  describe 'association' do
    it 'has many posts' do
      relation = described_class.reflect_on_association(:posts)
      expect(relation.macro).to eq :has_many
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
