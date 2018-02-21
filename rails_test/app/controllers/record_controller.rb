class RecordController < ApplicationController
    # recordコントローラはレンダリングがメイン
    def find
        @books=Book.find([2,5,8])
        render 'hello/list'
    end
    
    def find_by
        # @book=Book.all
        # findだとidでしか指定できない
        @book=Book.find_by(publish: 'Gihyo')
        # 複数取得するにはwhereを用いる
        @books=Book.where(publish: 'Gihyo')
        # books/showの引数が@bookなので@booksは渡せない
        render 'hello/list'
    end
    
    def exist
        flag=Book.where(publish: 'Gihyo').exists?
        render plain: "存在するか？ ： #{flag}"
        # plain: はプレーンテキストの意味
        # 特に他のURLにレンダリングしているわけではない
    end
    
    def scope
        @books=Book.gihyo.top10
        render 'hello/list'
    end
    
    def count
        cnt=Book.where(['price>?',1000]).count
        render plain: "#{cnt}件です"
    end
    
    def update_all
        Book.where(publish: '技術評論社').update_all(publish: '技評')
        @books=Book.all
        render 'hello/list'
    end
    
    def transact
        Book.transaction do
            b1=Book.new({isbn: '978-4-7741-5067-3',
                title: 'Rubyポケットリファレンス',
                price: 2600, publish: '技術評論社', published: '2017-04-17'
            })
            b1.save!
            # raise '例外処理：処理はキャンセルでし'
            b2=Book.new({isbn: '978-4-7741-5067-5',
                title:'Tomcatポケットリファレンス',
                price:2500, publish: '塚古社', published: '2017-05-10'
            })
            b2.save!
        end
        render plain: 'トランザクション成功'
    rescue => e
        render plain: e.message
    end
    
    def belongs
        @review = Review.find(3)
        @book = Book.find_by(isbn: '978-4-7741-8411-1')
        @user = User.find_by(username: 'yyamada')
    end
    
    def has_and_belongs
        @book=Book.find_by(isbn: '978-4-7980-4803-1')
    end
    
end