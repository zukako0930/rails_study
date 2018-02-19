module ViewHelper
    # datetime:整形対象の日時
    # type:出力のタイプ(日付時刻:datetime,日付のみ:date, 時刻のみ:time) 
    def format_datetime(datetime,type=:datetime)
        # 引数datetimeがnilの場合は空を返す
        return '' unless datetime
        case type
            when :datetime
                format='%Y/%m/%d %H:%M:%S'
            when :date
                format='%Y/%m/%d'
            when :time
                format='%H:%M:%S'
        end
        datetime.strftime(format)
    end
end