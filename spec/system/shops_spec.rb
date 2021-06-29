require 'rails_helper'

RSpec.describe Shop, type: :system do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:shop) { create(:shop, user: user) }
  let(:other_shop) { create(:shop, user: other_user) }

  before do
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe '投稿一覧画面のテスト' do
    before do
      visit shops_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/shops'
      end
      it '自分の投稿と他人の投稿のリンク先がそれぞれ正しい' do
        expect(page).to have_link '', href: shop_path(shop)
        expect(page).to have_link '', href: shop_path(other_shop)
      end
      it '自分の投稿と他人の投稿の説明文のみが表示される' do
        expect(page).to have_content shop.description
        expect(page).to have_content other_shop.description
     end
    end
  end
end