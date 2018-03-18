require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { FactoryBot.build(:like) }

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
