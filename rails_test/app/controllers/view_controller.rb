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
      
      # def create
      #     # book_params関数によってフォームの入力が各プロパティとしてセットされる
      #     # Book.new('978-4-7741-8411-1','改訂新版Javascript',....)的なイメージ
      #     @user = User.new(user_params)
      #     respond_to do |format|
      #       # saveメソッドでデータベースに登録
      #       if @user.save
      #         format.html { redirect_to @user, notice: 'Book was successfully created.' }
      #         # redirect_to @bookは/book/{今のbookのid}にリダイレクトしているのと同じ
      #         format.json { render :show, status: :created, location: @book }
      #       else
      #         format.html { render :new }
      #         format.json { render json: @user.errors, status: :unprocessable_entity }
      #       end
      #     end
      # end
      # def user_params
      #       params.require(:user).permit(:username, :email)
      # end
end