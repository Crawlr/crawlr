library(XML)
library(httr)
library(rjson)

url <- "http://stock.wespai.com/pick/choice"
val <- "qry%5B%5D=deal&qry%5B%5D=ep&id%5B%5D=deal&id%5B%5D=ep&"
body <- paste0(val, "val%5B%5D=602%3B3000000&val%5B%5D=50%3B30000")

header <- httr::add_headers("User-Agent"="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.155 Safari/537.36", 
                            "Content-Type"="application/x-www-form-urlencoded; charset=UTF-8", 
                            "Referer"="http://stock.wespai.com/pick", 
                            "Accept-Language"="en-US,en;q=0.8,zh-CN;q=0.6,zh;q=0.4,zh-TW;q=0.2,ja;q=0.2")
res <- httr::POST(url, body=body, encode='form', header)
res <- content(res, as='text')
parsedData <- fromJSON(res)
data <- do.call(rbind, parsedData)
View(data)