class ViewController < ApplicationController
      def col_select
            @book=Book.new(publish: '技術評論社',title: 'a')
            @books=Book.select(:publish, :title).distinct
      end
      
      def group_select
            @review=Review.new
            @authors=Author.all
      end
      
      def dat_select
            @book=Book.find(1)
            # Bookオブジェクトの１番目を変数@bookに代入している
            # よってdat_select.html.erb でform_for(@book)で:publishedのための
            # フォームを生成するとそいつの日付がデフォルトになる。
            # saveしてるわけじゃないので書き換えはできない。
      end
      
      def col_radio
            @book=Book.new(publish: '技術評論社')
            @books=Book.select(:publish).distinct
            # selectメソッドでデータベース上を参照する。実質SQL
      end
      
      def fields
            @user=User.find(1)
      end
      

      def simple_format
      end
      def truncate
      end
      def sanitize
      end
      
      
end