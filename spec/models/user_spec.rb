require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
      sleep 0.1
    end

    context 'ユーザー登録できる時' do
      it '全項目入力すると登録できる' do
        expect(@user).to be_valid
      end
      it 'positionは入力しなくても登録できる' do
        @user.position = false
        expect(@user).to be_valid
      end
      it '画像は入力しなくても登録できる' do
        @user.image = nil
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録できない時' do
      it 'last_nameが未記入では登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが未記入では登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが既に登録してあると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@がないと登録できない' do
        @user.email = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password, password_confirmationが一致していないと登録できない' do
        @user.password = 111_111
        @user.password_confirmation = 222_222
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下は登録できない' do
        @user.password = 11_111
        @user.password_confirmation = 11_111
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
    end
  end
end
