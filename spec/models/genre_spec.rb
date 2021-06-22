require 'rails_helper'

RSpec.describe Genre, type: :model do
  describe 'バリデーションのテスト' do
    let(:genre) { build(:genre) }

    it 'nameが空欄でないこと' do
      genre.name = ''
      expect(genre).to_not be_valid
    end
  end
end
