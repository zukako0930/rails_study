class CtrlController < ApplicationController
    def upload_process
        file=params[:upfile]
        name=file.original_filename
        # 許可する拡張子
        perms=['.jpg','.jpeg','.gif','.png']
        if !perms.include?(File.extname(name).downcase)
            result='アップロードできるのは画像ファイルのみです。'
        elsif file.size > 1.megabyte
            result = 'ファイルサイズは1MBまでです。'
        else
            File.open("public/docs/#{name}","wb"){|f| f.write(file.read)}
            result="#{name}をアップロードしました"
        end
        render plain: result
        
    end
    
end