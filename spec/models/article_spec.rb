require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    user = FactoryBot.create(:user)
    @article = FactoryBot.create(:article, user_id: user.id)
    sleep(0.1)
  end

  describe '記事投稿' do
    context '記事が投稿できる場合' do
      it 'titleとcontentとposterとimageが存在していても保存できる' do
        expect(@article).to be_valid
      end
      it 'imageが空でも保存できる' do
        @article.image = nil
        expect(@article).to be_valid
      end
    end
    context '記事が投稿できない場合' do
      it 'titleが空欄だと保存できない' do
        @article.title = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Title can't be blank")
      end
      it 'contentが空欄だと保存できない' do
        @article.content = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Content can't be blank")
      end
      it 'posterが空欄だと保存できない' do
        @article.poster = ''
        @article.valid?
        expect(@article.errors.full_messages).to include("Poster can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @article.user = nil
        @article.valid?
        expect(@article.errors.full_messages).to include('User must exist')
      end
    end
  end
end
