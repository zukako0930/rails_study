class Book < ApplicationRecord
    has_many :reviews
    scope :gihyo, -> { where(publish: '技術評論社') }
    scope :newer, -> { order(published: :desc) }
    scope :top10, -> { newer.limit(10) }
    # 検証ルールはモデルクラスに宣言する
    validates :isbn,
        presence: {message: 'は必須です。'},
        uniqueness: { allow_blank: true},
        length: {is: 17, allow_blank: true}
    validates :title,
        presence: {message: 'は必須です。'},
        uniqueness: { allow_blank: true },
        length: {minimum: 1, max: 5, allow_blank: true, message:'文字数は#{minimum}以上#{max}以下で入力してください'}
    validates :publish,
        presence: true
    validates :price,
        presence: true,
        numericality: {only_integer: true, less_than: 100000}
    
end
