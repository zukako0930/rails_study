class User < ApplicationRecord
    # アソシエーションを定義
    has_one :author
    
    # dmを必要とする場合のみemailを要求
    validates :email,
        presence: {unless: 'dm.blank?'}
end
