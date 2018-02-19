class Author < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :books 
#   上の行group_selectのためのアソシエーション
end
