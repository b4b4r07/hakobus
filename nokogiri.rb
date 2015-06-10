require 'nokogiri'
require 'anemone'

if ARGV.size < 2 then
    exit(1)
end

def get_date()
    ret = []
    opts = {
        depth_limit: 0
    }
    Anemone.crawl("http://www.hakobus.jp/result.php?in=" + ARGV[0] + "&out=" + ARGV[1], opts) do |anemone|
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

def get_time()
    ret = []
    opts = {
        depth_limit: 0
    }
    Anemone.crawl("http://www.hakobus.jp/result.php?in=" + ARGV[0] + "&out=" + ARGV[1], opts) do |anemone|
        anemone.on_every_page do |page|
            i = 1
            page.doc.xpath("/html/body/div[@id='container']/div[@id='contents']/div[@id='result']/table").each do |node|
                time = node.xpath("./tr/td/text()").to_s
                time.gsub!(/\r\n?/, "\n")
                time.each_line do |line|
                    ret.push(line) unless line.chomp.empty?
                end
                i += 1
            end
        end
    end
    return ret
end

dates = get_date()
get_time().each_with_index{|line,index|
    if line.gsub(/[^0-9]/,"").to_i < 15 || line.gsub(/[^0-9]/,"") == "" then
        puts dates[index] + " " + line
    end
}
