require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe 'いいねする' do
    context 'いいねできた' do
      it 'user_idとopinion_idが紐付いていればいいねできる' do
        expect(@like).to be_valid
      end
    end
    context 'いいねできなかった' do
      it 'user_idが紐付いていないといいねできない' do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("User can't be blank")
      end
      it 'opinion_idが紐付いていないといいねできない' do
        @like.opinion = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Opinion can't be blank")
      end
    end
  end
end
