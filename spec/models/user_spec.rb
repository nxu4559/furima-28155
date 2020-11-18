require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、last_name_kanaとfirst_name_kana、birthdayが存在すれば登録できる' do
          expect(@user).to be_valid
        end

        it 'passwordが６文字以上で半角英数字であれば登録できる' do
          @user.password = 'abcd123'
          @user.password_confirmation = 'abcd123'
          expect(@user).to be_valid
        end

        context '新規登録がうまくいかないとき' do
          it 'nicknameがない場合は登録できないこと' do
            @user.nickname = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Nickname can't be blank")
          end

          it 'emailがない場合は登録できないこと' do
            @user.email = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Email can't be blank")
          end

          it 'emailが一意性であること' do
            @user.save
            another_user = FactoryBot.build(:user, email: @user.email)
            another_user.valid?
            expect(another_user.errors.full_messages).to include('Email has already been taken')
          end

          it 'emailに@がないと登録できない' do
            @user.email = 'aaagmail.com'
            @user.valid?
            expect(@user.errors.full_messages).to include('Email is invalid')
          end

          it 'passwordが空だと登録できない' do
            @user.password = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Password can't be blank")
          end

          it 'passwordは５文字以下だと登録できない' do
            @user.password = '12345'
            @user.password_confirmation = '12345'
            @user.valid?
            expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
          end

          it 'パスワードは半角英数字混合であること' do
            @user.password = '123456'
            @user.password_confirmation = '123456'
            @user.valid?
            expect(@user.errors.full_messages).to include('Password is invalid')
          end

          it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
            @user.password_confirmation = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
          end

          it 'last_nameは空では登録できない' do
            @user.last_name = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name can't be blank")
          end

          it 'last_nameに半角英数字が存在すると登録できない' do
            @user.last_name = 'abc123'
            @user.valid?
            expect(@user.errors.full_messages).to include('Last name is invalid')
          end

          it 'first_nameは空では登録できない' do
            @user.first_name = ''
            @user.valid?
            expect(@user.errors.full_messages).to include("First name can't be blank")
          end

          it 'first_nameに半角英数字が存在すると登録できない' do
            @user.first_name = 'abc123'
            @user.valid?
            expect(@user.errors.full_messages).to include('First name is invalid')
          end

          it 'last_name_kanaは空では登録できない' do
            @user.last_name_kana = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Last name kana can't be blank")
          end

          it 'last_name_kanaに半角英数字が存在すると登録できない' do
            @user.last_name_kana = 'abc123'
            @user.valid?
            expect(@user.errors.full_messages).to include('Last name kana is invalid')
          end

          it 'last_name_kanaにひらがなが存在すると登録できない' do
            @user.last_name_kana = 'あいう'
            @user.valid?
            expect(@user.errors.full_messages).to include('Last name kana is invalid')
          end

          it 'first_name_kanaは空では登録できない' do
            @user.first_name_kana = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("First name kana can't be blank")
          end

          it 'first_name_kanaに半角英数字が存在すると登録できない' do
            @user.first_name_kana = 'abc123'
            @user.valid?
            expect(@user.errors.full_messages).to include('First name kana is invalid')
          end

          it 'first_name_kanaにひらがなが存在すると登録できない' do
            @user.first_name_kana = 'あいう'
            @user.valid?
            expect(@user.errors.full_messages).to include('First name kana is invalid')
          end

          it 'birthdayが空だと登録できない' do
            @user.birthday = nil
            @user.valid?
            expect(@user.errors.full_messages).to include("Birthday can't be blank")
          end
        end
      end
    end
  end
end
