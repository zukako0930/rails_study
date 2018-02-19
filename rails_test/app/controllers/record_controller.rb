class RecordController < ApplicationController
    # recordコントローラはレンダリングがメイン
    def find
        @books=Book.find([2,5,8])
        render 'hello/list'
    end
    
    def find_by
        # findだとidでしか指定できない
        @book=Book.find_by(publish: '技術評論社')
        # 複数取得するにはwhereを用いる
        @books=Book.where(publish: '技術評論社')
        # books/showの引数が@bookなので@booksは渡せない
        render 'books/show'
    end
    
    def exist
        flag=Book.where(publish: '新評論社').exists?
        render plain: "存在するか？ ： #{flag}"
        # plain: はプレーンテキストの意味
        # 特に他のURLにレンダリングしているわけではない
    end
end