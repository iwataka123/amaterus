class Position < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '一般' },
    { id: 3, name: '主査' },
    { id: 4, name: '係長' },
    { id: 5, name: '課長' },
    { id: 6, name: '部長' },
  ]

  include ActiveHash::Associations
  has_many :users

  end