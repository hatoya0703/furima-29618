require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  describe '商品購入機能' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @order = FactoryBot.build(:order_destination)
      @order.user_id = @user.id
      @order.item_id = @item.id
    end
    context '商品が正常に購入できる' do
      it 'すべての値が正しく入力されていれば購入ができること' do
        expect(@order).to be_valid
      end
      it 'buildingが空でも購入ができること' do
        @order.building = ''
        expect(@order).to be_valid
      end
    end
    context '商品が正常に購入できない' do
      it 'postal_codeが空だと購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'posta_codeがハイフン抜きだと購入できない' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal code is invalid')
      end
      it 'prefecture_idが空だと購入できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと購入できない' do
        @order.house_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("House number can't be blank")
      end
      it 'phoneが空だと購入できない' do
        @order.phone = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが12桁以上だと購入できない' do
        @order.phone = Faker::PhoneNumber.subscriber_number(length: 12)
        binding.pry
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end
      it 'phoneにハイフン(半角数字以外の文字)が入っていると購入できない' do
        @order.phone = '012-345-678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Phone is invalid')
      end
      it 'user_idが空だと購入できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと購入できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと購入できない' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
