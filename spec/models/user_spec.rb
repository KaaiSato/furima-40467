require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての入力項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_name_readingが空では登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it 'last_name_readingが空では登録できない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it 'birth-dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'テスト１２３'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'samplemail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'first_nameが英字では登録できない' do
        @user.first_name = 'sato'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角(漢字・ひらがな・カタカナ)を使用してください')
      end
      it 'last_nameが英字では登録できない' do
        @user.last_name = 'kaai'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角(漢字・ひらがな・カタカナ)を使用してください')
      end
      it 'first_name_readingが全角漢字では登録できない' do
        @user.first_name_reading = '佐藤'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading 全角(カタカナ)を使用してください')
      end
      it 'first_name_readingが全角ひらがなでは登録できない' do
        @user.first_name_reading = 'さとう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading 全角(カタカナ)を使用してください')
      end
      it 'first_name_readingが英字では登録できない' do
        @user.first_name_reading = 'sato'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name reading 全角(カタカナ)を使用してください')
      end
      it 'last_name_readingが全角漢字では登録できない' do
        @user.last_name_reading = '果愛'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading 全角(カタカナ)を使用してください')
      end
      it 'last_name_readingが全角ひらがなでは登録できない' do
        @user.last_name_reading = 'かあい'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading 全角(カタカナ)を使用してください')
      end
      it 'last_name_readingが英字では登録できない' do
        @user.last_name_reading = 'kaai'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name reading 全角(カタカナ)を使用してください')
      end
    end
  end
end
