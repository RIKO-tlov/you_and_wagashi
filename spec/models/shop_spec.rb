require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user)                  }
    let(:shop) { build(:shop, user_id: user.id) }

    it 'nameが空欄でないこと' do
      shop.name = ''
      expect(shop.valid?).to eq(false)
    end

    it 'kana_nameが空欄でないこと' do
      shop.kana_name = ''
      expect(shop.valid?).to eq(false)
    end

    it 'descriptionが200文字以下であること' do
      shop.description = Faker::Lorem.paragraphs(number: 201)
      expect(shop.valid?).to eq(false)
    end

    it 'postal_codeが空欄でないこと' do
      shop.postal_code = ''
      expect(shop.valid?).to eq(false)
    end

    it 'bussiness_start_timeが空欄でないこと' do
      shop.bussiness_start_time = ''
      expect(shop.valid?).to eq(false)
    end

    it 'bussiness_end_timeが空欄でないこと' do
      shop.bussiness_end_time = ''
      expect(shop.valid?).to eq(false)
    end

    it 'addressが空欄でないこと' do
      shop.address = ''
      expect(shop.valid?).to eq(false)
    end

    context 'telephone_numberカラム' do
      it 'telephone_numberが10桁未満の場合' do
        shop.telephone_number = '000000000'
        expect(shop.valid?).to eq(false)
      end

      it 'telephone_numberが11桁より多い場合' do
        shop.telephone_number = '000000000000'
        expect(shop.valid?).to eq(false)
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Reviewモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:reviews).macro).to eq :has_many
      end
    end

    context 'Visitモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:visits).macro).to eq :has_many
      end
    end

    context 'Wishモデルとの関係' do
      it '1:Nとなっている' do
        expect(Shop.reflect_on_association(:wishes).macro).to eq :has_many
      end
    end
  end
end
