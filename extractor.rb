filename = "messages.html"
messages_array = File.readlines(filename)
p messages_array.size
messages_string = messages_array.join
p messages_string.size
problems_urls = messages_string.scan(/https:\/\/leetcode.com\/problems\/[a-z.\/\-0-9]+/).uniq
p problems_urls.size

readme_array = ["### List of Leetcode tasks."," "] + problems_urls.map{|x| "- " + x}

IO.write("README.md", readme_array.join("\n"))
