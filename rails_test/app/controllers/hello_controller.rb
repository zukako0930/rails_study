class HelloController < ApplicationController
    def index
        # render plain: 'こんにちは世界！'
        @text='Hello-world!'
        @date_only=false
    end
    
    def list
        #
        @books=Book.all
    end
end
