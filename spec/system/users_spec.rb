require 'rails_helper'

RSpec.describe User, type: :system do
  let(:user)       { create(:user) }
  let(:other_user) { create(:user) }

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
    it '自分のnameが表示されている' do
      expect(page).to have_content user.name
    end
    it '自分のメールアドレスが表示される' do
      expect(page).to have_content user.email
    end
    it '自分の生年月日が表示されている' do
      expect(page).to have_content user.birthdate
    end
    it '自分の年齢が表示されている' do
      expect(page).to have_content user.age
    end
    it '行った店に自分の行った店の件数が表示され、リンクが正しい' do
      expect(page).to have_link '', href: visits_users_path
    end
    it '行ったことがある店に自分の行ったことがある店の件数が表示され、リンクが正しい' do
      expect(page).to have_link '', href: wishes_users_path
    end
     it 'reviewした店に自分のレビューした店の件数が表示され、リンクが正しい' do
      expect(page).to have_link '', href: reviews_users_path
    end
    it '編集ボタンが表示される' do
      expect(page).to have_link '編集', href: '/users/' + user.id.to_s + '/edit'
    end
    it '自身のユーザ編集画面に遷移できる' do
      visit edit_user_path(user)
      expect(current_path).to eq('/users/' + user.id.to_s + '/edit')
    end
    it '他人の編集画面には遷移できない' do
      visit edit_user_path(other_user)
      expect(current_path).to eq('/users/' + user.id.to_s)
    end
  end

  describe '自分のユーザ情報編集画面のテスト' do
    before do
      visit edit_user_path(user)
    end

    context '表示の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/' + user.id.to_s + '/edit'
      end
      it '名前編集フォームに自分の名前が表示される' do
        expect(page).to have_field 'user[name]', with: user.name
      end
      it '画像編集フォームが表示される' do
        expect(page).to have_field 'user[profile_image]'
      end
      it 'メールアドレス編集フォームに自分のメールアドレスが表示される' do
        expect(page).to have_field 'user[email]', with: user.email
      end
      it '生年月日編集フォームに自分の生年月日が表示される' do
        expect(page).to have_field 'user[birthdate]', with: user.birthdate
      end
      it '年齢編集フォームに自分の年齢が表示される' do
        expect(page).to have_field 'user[age]', with: user.age
      end
      it 'Update Userボタンが表示される' do
        expect(page).to have_button '変更を保存'
      end
    end

    context '更新成功のテスト' do
      before do
        @user_old_name = user.name
        @user_old_email = user.email
        @user_old_birthdate = user.birthdate
        @user_old_age = user.age
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 9)
        fill_in 'user[email]', with: Faker::Internet.free_email
        fill_in 'user[birthdate]', with: "2000-01-02"
        fill_in 'user[age]', with: '24'
        click_button '変更を保存'
      end

      it 'nameが正しく更新される' do
        expect(user.reload.name).not_to eq @user_old_name
      end
      it 'emailが正しく更新される' do
        expect(user.reload.email).not_to eq @user_old_email
      end
      it 'birthdateが正しく更新される' do
        expect(user.reload.birthdate).not_to eq @user_old_birthdate
      end
      it 'ageが正しく更新される' do
        expect(user.reload.age).not_to eq @user_old_email
      end
      it 'リダイレクト先が、自分のユーザ詳細画面になっている' do
        expect(current_path).to eq '/users/' + user.id.to_s
      end
    end
  end
end