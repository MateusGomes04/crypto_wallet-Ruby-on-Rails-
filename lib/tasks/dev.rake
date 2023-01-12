namespace :dev do
  desc "Configures the development envrioment"
  task setup: :environment do
   
    if Rails.env.development?

    show_spinner("Droping Database...") {%x(rails db:drop)}

    show_spinner("Creating Database...") {%x(rails db:create)}

    show_spinner("Migrating Database...") {%x(rails db:migrate)}
    %x(rails dev:add_coins)
    %x(rails dev:add_mining_types)


    else
      puts "You are not in the development envrioment to run this!!"
    end
  end

  desc "Register Coins"
  task add_coins: :environment do

    show_spinner("registering Coins...")  do
    coins = (
          [
            {
            description: "bitcoin",
            acronym: "BTC",
            url_image: "https://w7.pngwing.com/pngs/232/592/png-transparent-btc-crypto-cryptocurrency-cryptocurrencies-cash-money-bank-payment-icon.png",    
            },
            {
            description: "Etherum",
            acronym: "ETH",
            url_image: "https://img1.gratispng.com/20180516/ouw/kisspng-ethereum-cryptocurrency-blockchain-logo-eos-io-crypto-5afc9ab9b20d86.8643914515265041217293.jpg",    
            },
            {
            description: "Dash",
            acronym: "DASH",
            url_image: "https://cdn4.iconfinder.com/data/icons/crypto-currency-and-coin-2/256/dash_dashcoin-512.png",    
            }
          ]
    )

 coins.each do |coin|
       sleep(1)
       Coin.find_or_create_by!(coin)
 end
end
end

desc "registration of types of mining"
task add_mining_types: :environment do
  show_spinner("registering types of mining...")  do
  mining_types = [
    {description: "Proof of Work", acronym: "PoN"},
    {description: "Proof of Stake", acronym: "PoS"},
    {description: "Proof of Capacity", acronym: "PoC"}
  ]

mining_types.each do |mining_type|
  sleep(1)
  MiningType.find_or_create_by!(mining_type)
end
end 
end

  private
    def show_spinner(msg_start)
      spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
      spinner.auto_spin
      yield
      spinner.success('(task completed!)')
    end

end