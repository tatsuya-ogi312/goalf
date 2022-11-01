require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できる場合' do
      it '全ての条件が整っている' do
        expect(@comment).to be_valid
      end
    end
    context 'コメントが投稿できない場合' do
      it 'コメントが空だと投稿できない' do
        @comment.comment = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Commentを入力してください')
      end

      it 'userが紐付いていないと保存できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Userを入力してください')
      end

      it 'articleが紐付いていないと保存できない' do
        @comment.article = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Articleを入力してください')
      end
    end
  end
end
