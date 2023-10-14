require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザー登録できる' do
      it 'すべての情報を入力したら登録できる' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録できない' do
      it '名字が空で登録できない' do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it '名字が7文字以上だと登録できない' do
        @user.last_name = "井上佐藤田中望"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is too long (maximum is 6 characters)")
      end
      it '名字が空で登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it '名前が7文字以上だと登録できない' do
        @user.first_name = "井上佐藤田中望"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is too long (maximum is 6 characters)")
      end
      it 'emailが空だと登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空だと登録出来ない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録出来ない' do
        @user.password = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordとpassword_confirmationが一致していないと登録出来ない' do
        @user.save
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      
    end
  end
end
