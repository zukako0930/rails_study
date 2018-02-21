class HelloController < ApplicationController
    #indexアクションにのみ反応するbefore_action
    before_action :check_logined,only: :index
    
    def index
        # render plain: 'こんにちは世界！'
        @text='Hello-world!'
        @date_only=false
    end
    
    def list
        #
        @books=Book.all
    end
    
    #check_loginedフィルターの定義
    private
    def check_logined
        #セッション情報:usrが存在するかどうか
        if session[:usr] then
            # 存在する場合はusersテーブルを参照
            begin
              @usr=User.find(session[:usr])
            #存在しない場合は破棄
            rescue ActiveRecord::RecordNotFound
              reset_session
            end
        end
        # ログイン情報を取得できなかった場合はlogin#usrにレンダリング
        unless @usr
          flash[:referer]=request.fullpath
          redirect_to controller: :login, action: :index
        # render plain: 'ログイン失敗'
        end
            
    end
end
