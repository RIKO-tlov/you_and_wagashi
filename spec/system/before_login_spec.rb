require 'rails_helper'

describe 'ユーザログイン前のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/'
      end
      it 'guest_loginリンクが表示される: 左上から1番目のリンクが「ゲストログイン」である' do
        log_in_link = find_all('a')[1].native.inner_text
        expect(log_in_link).to match(/ゲストログイン/i)
      end
      it 'guest_loginリンクの内容が正しい' do
        guest_login_link = find_all('a')[1].native.inner_text
        expect(page).to have_link guest_login_link, href: homes_guest_sign_in_path
      end
      it 'log_inリンクが表示される: 左上から2番目のリンクが「ログイン」である' do
        log_in_link = find_all('a')[3].native.inner_text
        expect(log_in_link).to match(/ログイン/i)
      end
      it 'Log inリンクの内容が正しい' do
        log_in_link = find_all('a')[3].native.inner_text
        expect(page).to have_link log_in_link, href: new_user_session_path
      end
      it 'Sign Upリンクが表示される: 左上から6番目のリンクが「新規登録」である' do
        sign_up_link = find_all('a')[2].native.inner_text
        expect(sign_up_link).to match(/新規登録/i)
      end
      it 'Sign Upリンクの内容が正しい' do
        sign_up_link = find_all('a')[2].native.inner_text
        expect(page).to have_link sign_up_link, href: new_user_registration_path
      end
    end
  end

  describe 'アバウト画面のテスト' do
    before do
      visit '/about'
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/about'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしていない場合' do
    before do
      visit root_path
    end

    context '表示内容の確認' do
      it 'タイトルが表示される' do
        expect(page).to have_content 'あなたと和菓子と'
      end
      it 'ゲストログインリンクが表示される: 左上から1番目のリンクが「ゲストログイン」である' do
        guest_login_link = find_all('a')[1].native.inner_text
        expect(guest_login_link).to match(/ゲストログイン/i)
      end
      it 'sign upリンクが表示される: 左上から2番目のリンクが「新規登録」である' do
        signup_link = find_all('a')[2].native.inner_text
        expect(signup_link).to match(/新規登録/i)
      end
      it 'loginリンクが表示される: 左上から3番目のリンクが「ログイン」である' do
        login_link = find_all('a')[3].native.inner_text
        expect(login_link).to match(/ログイン/i)
      end
      it 'Aboutリンクが表示される: 左上から4番目のリンクが「About」である' do
        about_link = find_all('a')[4].native.inner_text
        expect(about_link).to match(/about/i)
      end
      it 'Rankingリンクが表示される: 左上から5番目のリンクが「ランキング」である' do
        ranking_link = find_all('a')[5].native.inner_text
        expect(ranking_link).to match(/ランキング/i)
      end
    end

    context 'リンクの内容を確認' do
      subject { current_path }

      it 'ゲストログインを押すと、トップ画面に遷移する' do
        guest_login_link = find_all('a')[1].native.inner_text
        guest_login_link = guest_login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link guest_login_link
        is_expected.to eq '/'
      end
      it 'sign upを押すと、新規登録画面に遷移する' do
        signup_link = find_all('a')[2].native.inner_text
        signup_link = signup_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link signup_link
        is_expected.to eq '/users/sign_up'
      end
      it 'loginを押すと、ログイン画面に遷移する' do
        login_link = find_all('a')[3].native.inner_text
        login_link = login_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link login_link
        is_expected.to eq '/users/sign_in'
      end
      it 'Aboutを押すと、アバウト画面に遷移する' do
        about_link = find_all('a')[4].native.inner_text
        about_link = about_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link about_link
        is_expected.to eq '/about'
      end

      it 'ランキングを押すと、ランキング画面に遷移する' do
        ranking_link = find_all('a')[5].native.inner_text
        ranking_link = ranking_link.gsub(/\n/, '').gsub(/\A\s*/, '').gsub(/\s*\Z/, '')
        click_link ranking_link
        is_expected.to eq '/ranking'
      end
    end
  end

  describe 'ユーザ新規登録のテスト' do
    before do
      visit new_user_registration_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_up'
      end
      it '「新規登録」と表示される' do
        expect(page).to have_content '新規登録'
      end
      it '名前フォームが表示される' do
        expect(page).to have_field 'user[name]'
      end
      it 'メールアドレスフォームが表示される' do
        expect(page).to have_field 'user[email]'
      end
      it '生年月日フォームが表示される' do
        expect(page).to have_field 'user_birthdate_1i'
        expect(page).to have_field 'user_birthdate_2i'
        expect(page).to have_field 'user_birthdate_3i'
      end
      it '年齢フォームが表示される' do
        expect(page).to have_field 'user[age]'
      end
      it '性別フォームが表示される' do
        expect(page).to have_field 'user[sex]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'password_confirmationフォームが表示される' do
        expect(page).to have_field 'user[password_confirmation]'
      end
      it '新規登録ボタンが表示される' do
        expect(page).to have_button '新規登録'
      end
    end

    context '新規登録成功のテスト' do

      before do
        fill_in 'user[name]', with: Faker::Lorem.characters(number: 10)
        fill_in 'user[email]', with: Faker::Internet.email
        find("#user_birthdate_1i").find("option[value='1990']").select_option
        find("#user_birthdate_2i").find("option[value='6']").select_option
        find("#user_birthdate_3i").find("option[value='8']").select_option
        fill_in 'user[age]', with: '23'
        choose "user[sex]", with: '女性'
        fill_in 'user[password]', with: 'password'
        fill_in 'user[password_confirmation]', with: 'password'
      end

      it '正しく新規登録される' do
        expect { click_button '新規登録' }.to change(User.all, :count).by(1)
      end
      it '新規登録後のリダイレクト先が、トップページになっている' do
        click_button '新規登録'
        expect(current_path).to eq root_path
      end
    end
  end

  describe 'ユーザログイン' do
    before do
      visit new_user_session_path
    end

    context '表示内容の確認' do
      it 'URLが正しい' do
        expect(current_path).to eq '/users/sign_in'
      end
      it '「ログイン」と表示される' do
        expect(page).to have_content 'ログイン'
      end
      it 'nameフォームが表示される' do
        expect(page).to have_field 'user[name]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'user[password]'
      end
      it 'emailフォームは表示されない' do
        expect(page).not_to have_field 'user[email]'
      end
    end

    context 'ログイン成功のテスト' do
      let(:user) { create(:user) }

      before do
        fill_in 'user[name]', with: user.name
        fill_in 'user[password]', with: user.password
        click_button 'ログイン'
      end

      it 'ログイン後のリダイレクト先が、トップページになっている' do
        expect(current_path).to eq '/'
      end
    end

    context 'ログイン失敗のテスト' do
      before do
        fill_in 'user[name]', with: ''
        fill_in 'user[password]', with: ''
        click_button 'ログイン'
      end

      it 'ログインに失敗し、ログイン画面にリダイレクトされる' do
        expect(current_path).to eq '/users/sign_in'
      end
    end
  end

  describe 'ヘッダーのテスト: ログインしている場合' do
    let(:user) { create(:user) }

    before do
      visit new_user_session_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
    end

    context 'ヘッダーの表示を確認' do
      it 'タイトルが表示される' do
        expect(page).to have_content 'あなたと和菓子と'
      end
      it 'Shop indexリンクが表示される: 左上から1番目のリンクが「お店一覧」である' do
        shop_index_link = find_all('a')[1].native.inner_text
        expect(shop_index_link).to match(/お店一覧/i)
      end
      it 'Shop newリンクが表示される: 左上から2番目のリンクが「紹介する」である' do
        shop_new_link = find_all('a')[2].native.inner_text
        expect(shop_new_link).to match(/紹介する/i)
      end
      it 'Aboutリンクが表示される: 左上から3番目のリンクが「About」である' do
        about_link = find_all('a')[3].native.inner_text
        expect(about_link).to match(/about/i)
      end
      it 'Rankingリンクが表示される: 左上から4番目のリンクが「ランキング」である' do
        about_link = find_all('a')[4].native.inner_text
        expect(about_link).to match(/ランキング/i)
      end
      it 'My pageリンクが表示される: 左上から5番目のリンクが「マイページ」である' do
        users_link = find_all('a')[5].native.inner_text
        expect(users_link).to match(/マイページ/i)
      end
      it 'log outリンクが表示される: 左上から6番目のリンクが「logout」である' do
        logout_link = find_all('a')[6].native.inner_text
        expect(logout_link).to match(/ログアウト/i)
      end
    end
  end
end
