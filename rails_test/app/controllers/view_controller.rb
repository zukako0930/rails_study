class ViewController < ApplicationController
      def col_select
            @book=Book.new(publish: '技術評論社')
            @books=Book.select(:publish).distinct
      end
end