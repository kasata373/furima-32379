require 'rails_helper'

# RSpec.describe User, type: :model do
#   describe "ユーザー新規登録" do
#     it "nicknameが空だと登録できない" do
#       user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000")
#       user.valid?
#       expect(user.errors.full_messages).to include("Name can't be blank")
#     end
#     it "emailが空では登録できない" do
#       user = User.new(nickname: "abe", email: "", password: "00000000", password_confirmation: "00000000")
#       user.valid?
#       expect(user.errors.full_messages).to include("Email can't be blank")
#     end
#   end
# end

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
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
       expect(@user.errors.full_messages).to include "Email is invalid"
      #  user = create(:user)
      #  another_user = build(:user, email: user.email)
      #  another_user.valid?
      #  expect(another_user.errors[:email]).to include "Email has already been taken"
    end
    it 'emailは、＠を含む必要があること' do
      @user.email = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it 'passwordは、６文字以上の入力が必要であること' do
      @user.password = "aaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too long (maximum is 6 characters)"
    end
    it 'passwordは、半角英数字混合での入力が必要であること' do
      @user.password = "ああああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it 'passwordは、確認用も含めて２回以上入力すること' do
      @user.encrypted_password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Encrypted password can't be blank"
    end
    it 'passwordとencrypted_password、値の一致が必須であること' do
      @user.password = "aaaaaa"
      @user.encrypted_password = "bbbbbb"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it "ユーザーの本名は、名字が必須であること" do
      @user.surname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Surname can't be blank"
    end
    it "ユーザーの本名は、名前が必須であること" do
      @user.name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end
    it "ユーザーの本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.surname = "ｱｱｱｱｱｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include 
    end
    it "ユーザーの本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.name = "ｱｱｱｱｱｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Name is invalid"
    end
    it "ユーザーの本名のフリガナは、名字が必須であること" do
      @user.surname_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Surname kana can't be blank"
    end
    it "ユーザーの本名のフリガナは、名前が必須であること" do
      @user.name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana can't be blank"
    end
    it "ユーザーのフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.surname_kana = "ｱｱｱｱｱｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Surname kana is invalid"
    end
    it "ユーザーのフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.name_kana = "ｱｱｱｱｱｱ"
      @user.valid?
      expect(@user.errors.full_messages).to include "Name kana is invalid"
    end
    it "生年月日が必須であること" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
    # it 'ログアウト状態では、ヘッダーに新規登録/ログインボタンが表示されること'
    #   @user_signed_in
    # end
    # it 'ログイン状態では、ヘッダーにユーザーのニックネーム/ログアウトボタンが表示されること'
    #   @user_sigoned_out
    # end
    # it 'ヘッダーの新規登録/ログインボタンをクリックすることで、各ページに遷移できること'
    # end
    # it 'ヘッダーのログアウトボタンをクリックすることで、ログアウトができること'
    # end
  end
end