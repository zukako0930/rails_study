class User < ApplicationRecord
    # アソシエーションを定義
    has_one :author
end
