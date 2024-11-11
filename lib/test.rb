require 'httparty'

response = HTTParty.get("https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd")
price = response["bitcoin"]["usd"]

puts "Current Bitcoin price: $#{price}"

def f (a)
    puts "u popa bula subaka pip yi lobyv vona vkrala kusok sala pip yi ubiv" + "u popa bula subaka pip yi lobyv vona vkrala kusok sala pip yi ubiv" +"u popa bula subaka pip yi lobyv vona vkrala kusok sala pip yi ubiv" +"u popa bula subaka pip yi lobyv vona vkrala kusok sala pip yi ubiv" +"u popa bula subaka pip yi lobyv vona vkrala kusok sala pip yi ubiv" +"u popa bula subaka pip yi lobyv vona vkrala kusok sala pip yi ubiv"
end
