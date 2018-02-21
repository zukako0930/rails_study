require 'rails_helper'
require 'date'

RSpec.describe Book, type: :model do
#   contextは状況を記述しておくため
# 例えば以下では不正なisbnに対する反応をテストする部分でエラー内容がわかるようにしている  
  context "1st model test" do
    it "1 book" do
      # model/book.rbのバリデーションに合わない場合はそっちのエラーが出る。
      book = build(:book) # Book.new -> .saveしない
      # book = create(:book) # Book.new -> .save
      expect(book).to be_valid
    end
    
    it "不正なisbn" do
        book = create(:book,isbn: "0") 
        #createだとDB側でエラーが出る?
        #
        expect(book).not_to be_valid
    end
  end
  
  context "scopeの実装" do
      it ".gihyo" do
          book = create(:book,publish: "技術評論社")
        #   model/book.rbでscopeを
        #   scope :gihyo, -> { where(publish: '技術評論社') }
        #   のように宣言しているので、Book.gihyoでBookDBのうち
        #   publishが技術評論社のものを指す
        #   大文字はDB参照
          expect(Book.gihyo.count).to eq 1
      end
      it ".newer" do
          book = create_list(:book,3)
          expect(Book.newer.first.published).to eq '2018-01-3'
      end
  end
end
