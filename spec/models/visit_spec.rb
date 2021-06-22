require 'rails_helper'

RSpec.describe Visit, type: :model do
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it '1:Nとなっている' do
        expect(Visit.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Shopモデルとの関係' do
      it '1:Nとなっている' do
        expect(Visit.reflect_on_association(:shop).macro).to eq :belongs_to
      end
    end
  end
end
