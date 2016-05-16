# coding: utf-8
# http://himaratsu.hatenablog.com/entry/ruby/img_dl を参考にした。

require 'open-uri'
require 'fileutils'

dir = './icons/'

if !FileTest.exist?(dir)
  FileUtils.mkdir_p(dir)  
end

for i in 1..333
  url = "http://sansyasanyou.com/core_sys/images/main/cont/special/ico/#{i}.png"
  name = File.basename(url)
  open(dir+name, 'w') {|output|
    open(url) {|input|
      output.write(input.read)
    }
  }
end

