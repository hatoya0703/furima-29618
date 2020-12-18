require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '正常に登録できるとき' do
      it 'nickname,email,password,password-confirmation,first_name,last_name,
      kana_first_name,kana_last_name,birth_dateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'first_nameは漢字・ひらがな・カタカナのいずれかであれば登録できる' do
        @user.first_name = '山田やまだヤマダ'
        expect(@user).to be_valid
      end
      it 'last_nameは漢字・ひらがな・カタカナのいずれかであれば登録できる' do
        @user.last_name = '太郎たろうタロウ'
        expect(@user).to be_valid
      end
    end

    context '登録できないとき' do
      it 'nickameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複するemailが存在する場合は登録できない' do
        @user.save
        user2 = FactoryBot.build(:user)
        user2.email = @user.email
        user2.valid?
        expect(user2.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'abcdef.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'password6文字以下では登録できない' do
        @user.password = 'ab1234'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが6文字以上であっても、半角英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが6文字以上あっても、半角数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationが等しくなければ登録できない' do
        @user.password_confirmation = @user.password + '5678'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
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
      it 'kana_first_nameが空では登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana first name can't be blank")
      end

      it 'kana_first_nameが漢字では登録できない' do
        @user.kana_first_name = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end
      it 'kana_first_nameがひらがなでは登録できない' do
        @user.kana_first_name = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end
      it 'kana_first_nameが半角英字では登録できない' do
        @user.kana_first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name is invalid')
      end

      it 'kana_last_nameが空では登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Kana last name can't be blank")
      end

      it 'kana_last_nameが漢字では登録できない' do
        @user.kana_last_name = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid')
      end
      it 'kana_last_nameがひらがなでは登録できない' do
        @user.kana_last_name = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid')
      end
      it 'kana_last_nameが英語では登録できない' do
        @user.kana_last_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name is invalid')
      end

      it 'birth_dateが空では登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
