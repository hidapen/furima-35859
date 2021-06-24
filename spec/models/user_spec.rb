require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user) 
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_name_furiganaとlast_name_furigana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it "＠を含めたemailは登録できる" do
        @user.email = 'aaa@aaa'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが一致すれば登録できる' do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
      it "passwordが半角英数字混合であれば登録できる" do
        @user.password = 'aaa000'
        @user.password_confirmation = 'aaa000'
        expect(@user).to be_valid
      end
      it "first_nameとlast_nameが全角（漢字・ひらがな・カタカナ）で登録できる" do
        @user.first_name = '松のエ'
        @user.last_name = '美チこ'
        expect(@user).to be_valid
      end
      it "first_name_furiganaとlast_name_furiganaが全角（カタカナ）で登録できる" do
        @user.first_name_furigana = 'マツノエ'
        @user.last_name_furigana = 'ミチコ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスを入力してください")
      end
      it "emailが他のemailと重複では登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
      end
      it "emailが@がなければ登録できない" do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスは不正な値です")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it "パスワードは半角英字のみだと登録できないこと" do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには半角で英字と数字の両方を含めて設定してください")

      end
      it "パスワードは半角数字のみだと登録できないこと" do
        @user.password = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには半角で英字と数字の両方を含めて設定してください")
      end
      it "パスワードは全角だと登録できないこと" do
        @user.password = '００００００'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードには半角で英字と数字の両方を含めて設定してください")
      end
      it "passwordとpassword_confirmationが不一致では登録できない" do
        @user.password = '000aaa'
        @user.password_confirmation = '111bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（名）を入力してください")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（姓）を入力してください")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（名）は全角（漢字・ひらがな・カタカナ）で入力してください")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない" do
        @user.last_name = 'taeko'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前（姓）は全角（漢字・ひらがな・カタカナ）で入力してください")
      end
      it "first_name_furiganaが空では登録できない" do
        @user.first_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名ふりがな)を入力してください")
      end
      it "last_name_furiganaが空では登録できない" do
        @user.last_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(姓ふりがな)を入力してください")
      end
      it "first_name_furiganaが全角（カタカナ）でないと登録できない" do
        @user.first_name_furigana = 'taeko'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(名ふりがな)は全角（カタカナ）で入力してください")
      end
      it "last_name_furiganaが全角（カタカナ）でないと登録できない" do
        @user.last_name_furigana = 'taeko'
        @user.valid?
        expect(@user.errors.full_messages).to include("お名前(姓ふりがな)は全角（カタカナ）で入力してください")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("お誕生日を入力してください")
      end
    end
  end
end