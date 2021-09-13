require 'rails_helper'

RSpec.describe General, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/image/test_image.png')
    @item.save
    sleep 0.5
    @general = FactoryBot.build(:general, user_id: @user.id, item_id: @item.id)
  end

  describe '購入情報登録' do
    
    context '商品を購入できる時' do
      it '全ての項目が存在すれば購入できる' do
        expect(@general).to be_valid
      end
      it '建物の入力は任意であること' do
        @general.building_name = ""
        expect(@general).to be_valid
      end       
    end

    context '商品が購入できない時' do
      it "uerが紐づいていないと登録できない" do
        @general.user_id = nil
        @general.valid?
        expect(@general.errors.full_messages).to include "User can't be blank"
      end
      it "itemが紐づいていないと登録できない" do
        @general.item_id = nil
        @general.valid?
        expect(@general.errors.full_messages).to include "Item can't be blank"
      end
      it '郵便番号の入力が必須であること' do
        @general.postal_code = ""
        @general.valid?
        expect(@general.errors.full_messages).to include "Postal code is valid."
      end
      it '郵便番号にはハイフンが必須であること' do
        @general.postal_code = "123456"
        @general.valid?
        expect(@general.errors.full_messages).to include "Postal code is valid."
      end
      it '都道府県の入力が必須であること' do
        @general.prefecture_id = 0
        @general.valid?
        expect(@general.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市町村の入力が必須であること' do
        @general.municipal_district = ""
        @general.valid?
        expect(@general.errors.full_messages).to include "Municipal district can't be blank"
      end
      it '番地の入力が必須であること' do
        @general.address = ""
        @general.valid?
        expect(@general.errors.full_messages).to include "Address can't be blank"
      end
      it '電話番号の入力は必須であること' do
        @general.phone_number = ""
        @general.valid?
        expect(@general.errors.full_messages).to include "Phone number can't be blank"
      end
      it '電話番号にはハイフンが不要であること' do
        @general.phone_number = "090-1234-5678"
        @general.valid?
        expect(@general.errors.full_messages).to include "Phone number is valid."
      end
      it '電話番号は11桁以内であること' do
        @general.phone_number = "090123456789"
        @general.valid?
        expect(@general.errors.full_messages).to include "Phone number is valid."
      end
      it '電話番号は半角数字でなければ登録できない' do
        @general.phone_number = "０９０aaaAAA"
        @general.valid?
        expect(@general.errors.full_messages).to include "Phone number is valid."
      end
      it "tokenが空では登録できないこと" do
        @general.token = ""
        @general.valid?
        expect(@general.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
