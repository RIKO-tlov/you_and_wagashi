require 'rails_helper'

RSpec.describe Shop, type: :model do
  describe 'バリデーションのテスト' do
    # factoriesで作成したダミーデータを使用します。
    let(:user) { FactoryBot.create(:user) }
    let!(:shop) { build(:shop, user_id: user.id) }

    # test_shopを作成し、空欄での登録ができるか確認します。
    subject { test_shop.valid? }
    let(:test_shop) { shop }


    it 'nameが空欄でないこと' do
      test_shop.name = ''
      is_expected.to eq false;
    end

    it 'kana_nameが空欄でないこと' do
      test_shop.kana_name = ''
      is_expected.to eq false;
    end

    it 'descriptionが200文字以下であること' do
      test_shop.description = Faker::Lorem.paragraphs(number:201)
      expect(test_shop.valid?).to eq false;
    end

    it 'postal_codeが空欄でないこと' do
      test_shop.postal_code = ''
      is_expected.to eq false;
    end

    it 'bussiness_start_timeが空欄でないこと' do
      test_shop.bussiness_start_time = ''
      is_expected.to eq false;
    end

    it 'bussiness_end_timeが空欄でないこと' do
      test_shop.bussiness_end_time = ''
      is_expected.to eq false;
    end

    it 'addressが空欄でないこと' do
      test_shop.address = ''
      is_expected.to eq false;
    end

    # it 'telephone_numberが11桁であること' do
    #   test_shop.telephone_number = { telephone_number
    #   is_expected.to eq true;
    # end




  end
end
