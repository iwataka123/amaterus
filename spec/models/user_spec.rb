require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "ユーザー情報に誤りがなければ登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'unique_user_idが空では登録できない' do
        @user.unique_user_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Unique user can't be blank", "Unique user は6桁の数字で入力してください")
      end
      it 'unique_user_idが5桁では登録できない' do
        @user.unique_user_id = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include("Unique user は6桁の数字で入力してください")
      end
      it 'unique_user_idが7桁では登録できない' do
        @user.unique_user_id = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Unique user は6桁の数字で入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'i123456'
        @user.password_confirmation = 'i1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password =  Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation =  @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'department_idが空白だと登録できない' do
        @user.department_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Department can't be blank")
      end
      it 'department_idが1だと登録できない' do
        @user.department_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Department can't be blank")
      end
      it 'position_idが空白だと登録できない' do
        @user.position_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Position can't be blank")
      end
      it 'position_idが1だと登録できない' do
        @user.position_id = '1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Position can't be blank")
      end
    end
  end
end
