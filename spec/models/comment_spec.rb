require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'チャットルーム機能' do
    before do
      @comment = FactoryBot.build(:comment)
    end

    context 'コメント投稿できる時' do
      it '必要事項が入力されていれば投稿できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿できる時' do
      it 'textが空では投稿できない' do
        @comment.text = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
