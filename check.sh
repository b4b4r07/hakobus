#!/bin/bash

text="$(ruby ./nokogiri.rb 156 165 | nkf)"
if [ -n "$text" ]; then
    terminal-notifier -title "美原→未来大学" -message "$text" -open "http://www.hakobus.jp/result.php?in=156&out=165" -contentImage "/Users/b4b4r07/Desktop/bus.png" -sound Submarine
fi


text="$(ruby ./nokogiri.rb 165 156 | nkf)"
if [ -n "$text" ]; then
    terminal-notifier -title "未来大学→美原" -message "$text" -open "http://www.hakobus.jp/result.php?in=156&out=165" -contentImage "/Users/b4b4r07/Desktop/bus.png" -sound Submarine
fi
