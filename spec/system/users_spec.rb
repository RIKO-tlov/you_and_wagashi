require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user)       { create(:user) }
  let(:other_user) { create(:user) }
  let(:review)     { create(:review) }

  before do
    visit new_user_session_path
    fill_in 'user[name]', with: user.name
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe 'ユーザー自身の詳細画面表示のテスト' do
    before do
      visit user_path(user)
    end

    it 'URLが正しい' do
      expect(current_path).to eq '/users/' + user.id.to_s
    end
    it 'reviewした店に自分のレビューした店の件数が表示され、リンクが正しい' do
      expect(page).to have_link '', href: reviews_users
    end
    it '自身のユーザ編集画面に遷移できる' do
      visit edit_user_path(user)
      expect(current_path).to eq('/users/' + user.id.to_s + '/edit' )
    end
    it '他人の編集画面には遷移できない' do
      visit edit_user_path(other_user)
      expect(current_path).to eq('/users/' + user.id.to_s )
    end
  end
end