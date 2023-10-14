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
  end
end
