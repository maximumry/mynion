require 'rails_helper'

RSpec.describe Opinion, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントを投稿する' do
    context 'コメントが投稿できた' do
      it 'テキストを入力して投稿できた' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントを投稿できなかった' do
      it 'テキストが空だと投稿できない' do
        @comment.text = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'userと紐付いていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User can't be blank")
      end
      it 'opinionと紐付いていないと投稿できない' do
        @comment.opinion = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Opinion can't be blank")
      end
    end
  end
end