require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品登録' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('item_sample.png')
      @item.user_id = @user.id
      binding.pry
    end

    context '正常に出品できるとき' do
      it 'name,description,category_id,price,status_id,delivery_fee_bearer_id,
      sender_area_id,shipping_date_id,user_idが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'priceが半角数字であれば出品できること' do
        @item.price = 11_111
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが1では出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが299以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが10000000以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが半角英字では出品できない' do
        @item.price = 'price'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceが全角数字では出品できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not included in the list')
      end
      it 'status_idが1では出品できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Status must be other than 1')
      end
      it 'delivery_fee_bearerが1では出品できない' do
        @item.delivery_fee_bearer_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee bearer must be other than 1')
      end
      it 'sender_area_idが1では出品できない' do
        @item.sender_area_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Sender area must be other than 1')
      end
      it 'shipping_date_idが1では出品できない' do
        @item.shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping date must be other than 1')
      end
      it 'user_idが空では出品できない' do
        @item.user_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("User can't be blank")
      end
      it 'imageが空では出品できない' do
        @item.image = ''
        @item.valid?
        expect(@item.errors.full_messages).to include
      end
    end
  end
end
