# coding: utf-8
# http://himaratsu.hatenablog.com/entry/ruby/img_dl を参考にした。

require 'open-uri'
require 'fileutils'

dir = File.expand_path('../icons/', __FILE__)

if !FileTest.exist?(dir)
  FileUtils.mkdir_p(dir)
  puts "ディレクトリ #{dir} を作成しました。"
end

for i in 1..333
  url = "http://sansyasanyou.com/core_sys/images/main/cont/special/ico/#{i}.png"
  name = File.basename(url)
  file = dir + '/' + name
  if FileTest.exist?(file)
    # puts "#{name} はスキップされました。"
    next
  end
  open(file, 'w') {|output|
    open(url) {|input|
      output.write(input.read)
      puts "#{name} をダウンロードしました。"
    }
  }
end
