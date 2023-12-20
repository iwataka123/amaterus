require 'rails_helper'

RSpec.describe Check, type: :model do
  before do
    user = FactoryBot.create(:user)
    article = FactoryBot.create(:article)
    @check = FactoryBot.create(:check, user_id: user.id, article_id: article.id)
  end
  describe 'checkの登録' do
    context 'checkが登録できる場合' do
      it 'user_idとarticle_idが存在すれば登録できる' do
        expect(@check).to be_valid
      end
    end
    context 'checkが登録できないとき' do
      it 'user_idが空だと登録できない' do
        @check.user_id = nil
        @check.valid?
        expect(@room_user.errors.full_messages).to include("User must exist")
      end
      it 'article_idが空だと登録できない' do
        @check.room_id = nil
        @check.valid?
        expect(@check.errors.full_messages).to include("Article must exist")
      end
    end
  end
end
