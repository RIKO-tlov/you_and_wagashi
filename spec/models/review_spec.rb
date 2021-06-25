require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user)                                        }
    let(:shop) { build(:shop, user_id: user.id)                       }
    let(:review) { build(:review, shop_id: shop.id, user_id: user.id) }

    it 'product_nameが空欄でないこと' do
      review.product_name = ''
      expect(review.valid?).to eq(false)
    end

    context 'commentカラム' do
      it '空欄でないこと' do
        review.comment = ''
        expect(review.valid?).to eq(false)
      end

      it '200文字以下であること' do
        review.comment = Faker::Lorem.paragraphs(number: 201)
        expect(review.valid?).to eq(false)
      end
    end

    context 'rateカラム' do
      it '空欄でないこと' do
        review.rate = ''
        expect(review.valid?).to eq(false)
      end

      it '5以内であること' do
        review.rate = '6'
        expect(review.valid?).to eq(false)
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it '1:Nとなっている' do
        expect(Review.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end

    context 'Shopモデルとの関係' do
      it '1:Nとなっている' do
        expect(Review.reflect_on_association(:shop).macro).to eq :belongs_to
      end
    end
  end
end
