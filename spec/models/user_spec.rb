require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    context 'ユーザー登録できる時' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザー新規登録できない時' do
     it 'nicknameが空では登録できない' do
       @user.nickname = ""
       @user.valid?
       expect(@user.errors.full_messages).to include "Nickname can't be blank"
     end
     it 'emailが空では登録できない' do
       @user.email = ""
       @user.valid?
       expect(@user.errors.full_messages).to include "Email can't be blank"
     end
     it 'emailが一意性であること' do
        @user.save
        @another_user = FactoryBot.build(:user)
        @another_user.email = @user.email
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include "Email has already been taken"
     end
     it 'emailは、＠を含む必要があること' do
       @user.email = "aaaaaaa"
       @user.valid?
       expect(@user.errors.full_messages).to include "Email is invalid"
     end
     it 'passwordは、６文字以上の入力が必要であること' do
       @user.password = "a1b2c"
       @user.valid?
       expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
     end
     it 'パスワードが空では登録できない' do
       @user.password = ""
       @user.valid?
       expect(@user.errors.full_messages).to include "Password can't be blank"
     end
     it '英字のみのパスワードでは登録できない' do
       @user.password = "AaAaAa"
       @user.valid?
       expect(@user.errors.full_messages).to include "Password is invalid"
     end
     it '数字のみのパスワードでは登録できない' do
       @user.password = "123456"
       @user.valid?
       expect(@user.errors.full_messages).to include "Password is invalid"
     end
     it 'passwordは、半角英数字混合での入力が必要であること' do
       @user.password = "ああああああ"
       @user.valid?
       expect(@user.errors.full_messages).to include "Password is invalid"
     end
     it 'passwordは、確認用も含めて２回以上入力すること' do
       @user.password_confirmation = ""
       @user.valid?
       expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end
     it 'passwordとencrypted_password、値の一致が必須であること' do
       @user.password = "aaaaaa"
       @user.password_confirmation = "bbbbbb"
       @user.valid?
       expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
     end
     it 'ユーザーの本名は、名字が必須であること' do
       @user.surname = ""
       @user.valid?
       expect(@user.errors.full_messages).to include "Surname can't be blank"
     end
     it 'ユーザーの本名は、名前が必須であること' do
       @user.name = ""
       @user.valid?
       expect(@user.errors.full_messages).to include "Name can't be blank"
     end
     it 'ユーザーの本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
       @user.surname = "ｱｱｱｱｱｱ"
       @user.valid?
       expect(@user.errors.full_messages).to include 
     end
     it 'ユーザーの本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
       @user.name = "ｱｱｱｱｱｱ"
       @user.valid?
       expect(@user.errors.full_messages).to include "Name is invalid"
     end
     it 'ユーザーの本名のフリガナは、名字が必須であること' do
       @user.surname_kana = ""
       @user.valid?
       expect(@user.errors.full_messages).to include "Surname kana can't be blank"
     end
     it 'ユーザーの本名のフリガナは、名前が必須であること' do
       @user.name_kana = ""
       @user.valid?
       expect(@user.errors.full_messages).to include "Name kana can't be blank"
     end
     it 'ユーザーのフリガナは、全角（カタカナ）での入力が必須であること' do
       @user.surname_kana = "ｱｱｱｱｱｱ"
       @user.valid?
       expect(@user.errors.full_messages).to include "Surname kana is invalid"
     end
     it 'ユーザーのフリガナは、全角（カタカナ）での入力が必須であること' do
       @user.name_kana = "ｱｱｱｱｱｱ"
       @user.valid?
       expect(@user.errors.full_messages).to include "Name kana is invalid"
     end
     it '生年月日が必須であること' do
       @user.birthday = ""
       @user.valid?
       expect(@user.errors.full_messages).to include "Birthday can't be blank"
     end
   end

  end
end