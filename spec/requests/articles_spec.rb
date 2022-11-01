require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  before do
    @article = FactoryBot.create(:article)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのツイートのテキストが存在する' do
      get root_path
      expect(response.body).to include(@article.title)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する' do
      get root_path
      expect(response.body).to include('記事を検索する')
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get article_path(@article.id)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのツイートのタイトルが存在する' do
      get article_path(@article.id)
      expect(response.body).to include(@article.title)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのツイートの説明文が存在する' do
      get article_path(@article.id)
      expect(response.body).to include(@article.content)
    end
    it 'showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する' do
      get article_path(@article.id)
      expect(response.body).to include('＜コメント一覧＞')
    end
  end
end
