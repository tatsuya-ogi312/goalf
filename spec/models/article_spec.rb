require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    @article = FactoryBot.build(:article)
  end

  describe '記事投稿' do
    context '記事が投稿できる場合' do
      it '全ての情報が存在していれば保存できる' do
        expect(@article).to be_valid
      end

      it 'URLが存在していなくても保存できる' do
        @article.url = ''
        expect(@article).to be_valid
      end

      it '画像が添付されていなくても保存できる' do
        @article.image = nil
        expect(@article).to be_valid
      end
    end

    context '記事が投稿できない場合' do
      it 'タイトルが空では保存できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("タイトルを入力してください")
      end

      it '説明文が空では保存できない' do
        @article.content = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("説明文を入力してください")
      end

      it 'カテゴリーが---では保存できない' do
        @article.category_id = '1'
        @article.valid?
        expect(@article.errors.full_messages).to include("カテゴリーを入力してください")
      end

      it 'ユーザーが紐付いていないと保存できない' do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end