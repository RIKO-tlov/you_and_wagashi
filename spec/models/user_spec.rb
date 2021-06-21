require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'バリデーション' do
    it "名前とメールアドレスとパスワードがあれば登録できる" do
      expect(@user.valid?).to eq(true)
    end

    it "名前がなければ登録できない" do
      @user.name = ''
      expect(@user.valid?).to eq(false)
    end

    it "メールアドレスがなければ登録できない" do
      @user.email = ''
      expect(@user.valid?).to eq(false)
    end

    it "生年月日がなければ登録できない" do
      @user.birthdate = ''
      expect(@user.valid?).to eq(false)
    end

    it "年齢がなければ登録できない" do
      @user.age = ''
      expect(@user.valid?).to eq(false)
    end

    it "性別がなければ登録できない" do
      @user.sex = ''
      expect(@user.valid?).to eq(false)
    end

    it "メールアドレスが重複していたら登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      expect(another_user.valid?).to eq(false)
    end

    it "名前が重複していたら登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.name = @user.name
      expect(another_user.valid?).to eq(false)
    end

    it "パスワードがなければ登録できない" do
      @user.password = ''
      expect(@user.valid?).to eq(false)
    end

    it "パスワードが暗号化されているか" do
      expect(@user.encrypted_password).to_not eq 'password'
    end

    it "password_confirmationとpasswordが異なる場合保存できない" do
      expect(FactoryBot.build(:user,password:"password",password_confirmation: "passward")).to_not be_valid
    end

  end


end