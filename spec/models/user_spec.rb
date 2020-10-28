require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録がうまくいくとき'
    it "nickname,email,password,password_confirmation,last_name,first_name,last_kana,first_kana,birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
    end
    it "nicknameが40文字以下で登録できる" do
      @user.nickname = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
      expect(@user).to be_valid
    end
    it "passwordが半角英数混合6文字以上であれば登録できる" do
      @user.password = "abc000"
      @user.password_confirmation = "abc000"
      expect(@user).to eq be_valid
    end
  end

  describe 'ユーザー新規登録がうまくいかないとき' do
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailが一意性でないので登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "psswordが6文字以上でないので登録できない" do
      @user.password = "abc00"
      @user.password_confirmation = "abc00"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角英数混合でないので登録できない" do
      @user.password = "000000"
      @user.password_confirmation = "000000" 
      @user.valid?
      expect(@user.errors.full_messages).to include("invalid password")
    end
    it "password（確認用）が空だと登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが確認用と一致していないので登録できない" do
      @user.password = "abc000"
      @user.password_confirmation = "abcd000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "本名が空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank") 
    end
    it "本名が全角（漢字・ひらがな・カタカナ）でないので登録できない" do
      @user.last_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "フリガナが空だと登録できない" do
      @user.last_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana can't be blank")
    end
    it "フリガナが全角（カタカナ）でないので登録できない" do
      @user.last_kana = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kana is invalid")
    end
    it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
