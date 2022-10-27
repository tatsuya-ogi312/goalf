require 'rails_helper'

RSpec.describe Golfer, type: :model do
  before do
    @golfer = FactoryBot.build(:golfer)
  end

  describe 'ゴルファー情報登録' do
    context 'ゴルファー情報登録できる場合' do
      it '全ての情報が存在していれば保存できる' do
        expect(@golfer).to be_valid
      end

      it '悩みが存在していなくても保存できる' do
        @golfer.worries = ''
        expect(@golfer).to be_valid
      end

      it '特徴が添付されていなくても保存できる' do
        @golfer.feature = ''
        expect(@golfer).to be_valid
      end
    end

    context 'ゴルファー情報が登録できない場合' do
      it '平均パット数が空では保存できない' do
        @golfer.average_putt = ''
        @golfer.valid?
        expect(@golfer.errors.full_messages).to include("平均パット数を入力してください")
      end

      it '平均スコアが---では保存できない' do
        @golfer.average_score_id = '1'
        @golfer.valid?
        expect(@golfer.errors.full_messages).to include("平均スコアを入力してください")
      end

      it '利き手が---では保存できない' do
        @golfer.dominant_hand_id = '1'
        @golfer.valid?
        expect(@golfer.errors.full_messages).to include("利き手を入力してください")
      end

      it '種類が---では保存できない' do
        @golfer.type_id = '1'
        @golfer.valid?
        expect(@golfer.errors.full_messages).to include("種類を入力してください")
      end

      it 'ゴルフ歴が---では保存できない' do
        @golfer.golf_history_id = '1'
        @golfer.valid?
        expect(@golfer.errors.full_messages).to include("ゴルフ歴を入力してください")
      end

      it 'userが紐付いていないと保存できない' do
        @golfer.user = nil
        @golfer.valid?
        expect(@golfer.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
