require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できる' do

      it 'emailに@が含まれていると登録できる' do
        expect(@user.email).to include('@')
        be_valid
      end
    end

    context '新規登録できない時' do

      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordが5文字以下だと登録できないこと' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'bbbbbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'passwordが全角だと登録できない' do
        @user.password = 'あああ111'
        @user.password_confirmation = 'あああ111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'last_nameが空だと登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it 'last_nameが半角文字だと登録できない' do
        @user.last_name = 'aA田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it 'first_nameが空だと登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it 'first_nameが半角文字だと登録できない' do
        @user.first_name = 'aA郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'last_name_katakanaが空だと登録できない' do
        @user.last_name_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana can't be blank")
      end

      it 'last_name_katakanaが半角文字だと登録できない' do
        @user.last_name_katakana = 'aAタ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana is invalid")
      end

      it 'last_name_katakanaがカタカナ以外の全角文字だと登録できない' do
        @user.last_name_katakana = '山だ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name katakana is invalid")
      end

      it 'first_name_katakanaが空だと登録できない' do
        @user.first_name_katakana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana can't be blank")
      end

      it 'first_name_katakanaが半角文字だと登録できない' do
        @user.first_name_katakana = 'aAタ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid")
      end

      it 'first_name_katakanaがカタカナ以外の全角文字だと登録できない' do
        @user.first_name_katakana = 'たロウ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name katakana is invalid")
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

    end
  end
end
