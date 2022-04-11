#=

██╗     ██╗███╗   ██╗██╗  ██╗    ██████╗  ██████╗     ██╗   ██╗██╗██████╗ ███████╗ ██████╗ 
██║     ██║████╗  ██║██║ ██╔╝    ██╔══██╗██╔═══██╗    ██║   ██║██║██╔══██╗██╔════╝██╔═══██╗
██║     ██║██╔██╗ ██║█████╔╝     ██║  ██║██║   ██║    ██║   ██║██║██║  ██║█████╗  ██║   ██║
██║     ██║██║╚██╗██║██╔═██╗     ██║  ██║██║   ██║    ╚██╗ ██╔╝██║██║  ██║██╔══╝  ██║   ██║
███████╗██║██║ ╚████║██║  ██╗    ██████╔╝╚██████╔╝     ╚████╔╝ ██║██████╔╝███████╗╚██████╔╝
╚══════╝╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝    ╚═════╝  ╚═════╝       ╚═══╝  ╚═╝╚═════╝ ╚══════╝ ╚═════╝ 
                                                                                           

https://youtu.be/dZSnsonukyA

=#

using HTTP
using JSON

function call(url)

    try
        response  = HTTP.get(url)
        return JSON.parse(String(response.body))
    catch e
        return "ERROR: $(e)"
    end

end

function main()

    # https://docs.awesomeapi.com.br/api-de-moedas
    url = "https://economia.awesomeapi.com.br/last/USD-BRL"

    r = call(url)
    printResponse(r)
end

function printResponse(dict)
    println("code                                => ", dict["USDBRL"]["code"])
    println("codein                              => ", dict["USDBRL"]["codein"])
    println("name                                => ", dict["USDBRL"]["name"])
    println("high                                => ", dict["USDBRL"]["high"])
    println("low                                 => ", dict["USDBRL"]["low"])
    println("varBid (variacao)                   => ", dict["USDBRL"]["varBid"])
    println("pctChange (porcentagem de variação) => ", dict["USDBRL"]["pctChange"])
    println("bid (compra)                        => ", dict["USDBRL"]["bid"])
    println("ask (venda)                         => ", dict["USDBRL"]["ask"])
    println("timestamp                           => ", dict["USDBRL"]["timestamp"])
    println("create_date                         => ", dict["USDBRL"]["create_date"])
end

main()