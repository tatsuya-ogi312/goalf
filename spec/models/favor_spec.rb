require 'rails_helper'

RSpec.describe Favor, type: :model do
  before do
    @favor = FactoryBot.build(:favor)
  end

  describe 'お気に入り登録' do
    context 'お気に入り登録できる場合' do
      it '全ての条件が整っている' do
        expect(@favor).to be_valid
      end
    end
    context 'お気に入り登録できない場合' do

      it 'userが紐付いていないと保存できない' do
        @favor.user = nil
        @favor.valid?
        expect(@favor.errors.full_messages).to include('Userを入力してください')
      end

        it 'articleが紐付いていないと保存できない' do
          @favor.article = nil
          @favor.valid?
          expect(@favor.errors.full_messages).to include('Articleを入力してください')
        end
    end

  end
end
