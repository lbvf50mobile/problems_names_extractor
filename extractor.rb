files_pattern = /^messages[[:digit:]]*.html$/
files_names = Dir.entries(".").select{|x| files_pattern === x}
p "Files: #{files_names.size}"
messages_array = files_names.map{|filename| File.readlines(filename)}.flatten
p "Strings: #{messages_array.size}"
messages_string = messages_array.join
p "Characters: #{messages_string.size}"
problems_urls = messages_string.scan(/https:\/\/leetcode.com\/problems\/[a-z.\-0-9]+/).uniq
p "Problems: #{problems_urls.size}"


readme_array = ["### List of Leetcode tasks.  ","Number of mentioned problems: #{problems_urls.size}  "] + problems_urls.map{|x| "- " + x}

IO.write("README.md", readme_array.join("\n"))
