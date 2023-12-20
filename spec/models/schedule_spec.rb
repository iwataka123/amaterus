require 'rails_helper'

RSpec.describe Schedule, type: :model do
  before do
    user = FactoryBot.create(:user)
    @schedule = FactoryBot.create(:schedule, user_id: user.id)
    sleep(0.1)
  end

  describe 'スケジュール作成' do
    context 'スケジュールが作成できる場合' do
      it 'titleとcontentとstart_timeが存在していたら保存できる' do
        expect(@schedule).to be_valid
      end
      it 'contentが空でも保存できる' do
        @schedule.content = nil
        expect(@schedule).to be_valid
      end
    end
    context '記事が投稿できない場合' do
      it 'titleが空欄だと保存できない' do
        @schedule.title = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Title can't be blank")
      end
      it 'start_timeが空欄だと保存できない' do
        @schedule.start_time = ''
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include("Start time can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @schedule.user = nil
        @schedule.valid?
        expect(@schedule.errors.full_messages).to include('User must exist')
      end
    end
  end
end
