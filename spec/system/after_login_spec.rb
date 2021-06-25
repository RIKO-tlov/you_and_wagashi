require 'rails_helper'

describe 'ユーザログイン後のテスト' do
  let(:user) { create(:user) }

  before do
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    context 'リンクの内容を確認: ※logoutはbefore_log_inでテスト済み' do
      subject { current_path }

      it 'お店一覧を押すと、和菓子店一覧画面に遷移する' do
        shop_index_link = find_all('a')[1].native.inner_text
        shop_index_link = shop_index_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link shop_index_link
        is_expected.to eq '/shops'
      end
      it '紹介するを押すと、新規投稿画面に遷移する' do
        shop_new_link = find_all('a')[2].native.inner_text
        shop_new_link = shop_new_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link shop_new_link
        is_expected.to eq '/shops/new'
      end
      it 'Aboutを押すと、About画面に遷移する' do
        about_link = find_all('a')[3].native.inner_text
        about_link = about_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link about_link
        is_expected.to eq '/about'
      end
      it 'ランキングを押すと、ランキング画面に遷移する' do
        ranking_link = find_all('a')[4].native.inner_text
        ranking_link = ranking_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link ranking_link
        is_expected.to eq '/ranking'
      end
      it 'マイページを押すと、ユーザのマイページ画面に遷移する' do
        mypage_link = find_all('a')[5].native.inner_text
        mypage_link = mypage_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link mypage_link
        is_expected.to eq '/users/' + user.id.to_s
      end
    end
  end
end
