require 'rails_helper'

RSpec.describe RoomUser, type: :model do
  before do
    user = FactoryBot.create(:user)
    room = FactoryBot.create(:room)
    @room_user = FactoryBot.build(:room_user, user_id: user.id, room_id: room.id)
  end
  describe 'room_userの登録' do
    context 'room_userが登録できる場合' do
      it 'user_idとroom_idが存在すれば登録できる' do
        expect(@room_user).to be_valid
      end
    end
    context 'Room_userが登録できないとき' do
      it 'user_idが空だと登録できない' do
        @room_user.user_id = nil
        @room_user.valid?
        expect(@room_user.errors.full_messages).to include("User must exist")
      end
      it 'room_idが空だと登録できない' do
        @room_user.room_id = nil
        @room_user.valid?
        expect(@room_user.errors.full_messages).to include("Room must exist")
      end
    end
  end
end
