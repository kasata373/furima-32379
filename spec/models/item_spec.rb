require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

 describe '商品情報登録' do

  context '商品情報を登録できない時' do
    it '全ての項目が存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end

  context '商品情報が登録できない時' do
    it '商品名が必須であること' do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Name can't be blank"
    end
    it '商品の説明が必須であること' do
      @item.product = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Product can't be blank"
    end
    it 'カテゴリーの情報が必須てあること' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it '商品の情報についての情報が必須であること' do
      @item.state_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "State can't be blank"
    end
    it '配送料の負担についての情報が必須であること' do
      @item.postage_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Postage can't be blank"
    end
    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Prefecture can't be blank"
    end
    it '発送までの日数についての情報が必須であること' do
      @item.shipping_date_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping date can't be blank"
    end
    it '価格についての情報が必須であること' do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it '価格の範囲が、￥300~¥9,999,999の間であること' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than 300"
    end
    it '価格の範囲が、￥300~¥9,999,999の間であること' do
      @item.price = 1000000000000000
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be less than 9999999"
    end
    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = 'A1A1A1A1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it '販売価格は全角数字では登録できない' do
      @item.price = 'AAAAAAA'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it '販売価格は半角英字のみだと登録できない' do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it '画像が空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include "Image can't be blank"
    end
  end

 end
end