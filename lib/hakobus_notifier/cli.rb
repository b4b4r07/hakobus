# _*_ coding: utf-8 _*_

require 'hakobus_notifier'
require 'thor'
require 'nokogiri'
require 'anemone'
require 'terminal-notifier'

module HakobusNotifier
    class CLI < Thor
        default_command :start
        desc "notify bus information", ""
        def start(src="156", dest="165")
            terminal_notifier(get_date(src, dest), get_time(src, dest), src, dest)
        end
    end
end

def terminal_notifier(str, time, src, dest)
    if str.length == 0
        s = "unavailable"
        t = "本日の営業は終了しました"
        return
    else
        s = str[0]
        t = time[0]
    end

    title = table(src) + " ➔ " + table(dest)
    body = "🚌 " + s + "（" + t.chomp + "）"
    TerminalNotifier.notify(body, title: title, sound: 'Hero', group: 'hakobus', activate: 'com.apple.Terminal')
end

def table(src)
    hakobus_table = {
        函館駅前: 3,
        函館地方気象台: 156, 
        公立はこだて未来大学: 165, 
    }

    hakobus_table.each do |key, value|
        if "#{value}" == "#{src}"
            return "#{key}"
        end
    end
end

def get_date(src, dest)
    ret = []
    opts = {
        depth_limit: 0
    }
    Anemone.crawl("http://www.hakobus.jp/result.php?in=" + src.to_s + "&out=" + dest.to_s, opts) do |anemone|
        anemone.on_every_page do |page|
            i = 1
            page.doc.xpath("/html/body/div[@id='container']/div[@id='contents']/div[@id='result']/table/tr").each do |node|
                date = node.xpath("./td[@width='50']/div/text()").to_s
                date.gsub!(/\r\n?/, "\n")
                date.each_line do |line|
                    ret.push(line) unless line.chomp.empty?
                end
                i += 1
            end
        end
    end
    return ret
end

def get_time(src, dest)
    ret = []
    opts = {
        depth_limit: 0
    }
    Anemone.crawl("http://www.hakobus.jp/result.php?in=" + src.to_s + "&out=" + dest.to_s, opts) do |anemone|
        anemone.on_every_page do |page|
            i = 1
            page.doc.xpath("/html/body/div[@id='container']/div[@id='contents']/div[@id='result']/table").each do |node|
                time = node.xpath("./tr/td/text()").to_s
                time.gsub!(/\r\n?/, "\n")
                time.each_line do |line|
                    ret.push(line.encode("UTF-8")) unless line.chomp.empty?
                end
                i += 1
            end
        end
    end
    return ret
end
