class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:unique_user_id]

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :department
  belongs_to :position

  with_options presence: true do
    validates :unique_user_id
    validates :name
  end

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :department_id
    validates :position_id
  end

  #unique_user_idを利用してログインするようにオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["unique_user_id = :value", { :value => unique_user_id }]).first
    else
      where(conditions).first
    end
  end

  def email_required?
    false
  end
      
  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end

end