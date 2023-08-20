import Foundation

// Definindo a enumeração Currency
enum Currency {
    case usd
    case eur
    case brl
    
    var symbol: String {
        switch self {
        case .usd:
            return "$"
        case .eur:
            return "€"
        case .brl:
            return "R$"
        }
    }
}

// Definindo a struct ExchangeRate
struct ExchangeRate {
    let usdToEur: Double
    let usdToBrl: Double
}

// Definindo a classe CurrencyConverter
class CurrencyConverter {
    let exchangeRate: ExchangeRate
    
    init(exchangeRate: ExchangeRate) {
        self.exchangeRate = exchangeRate
    }
    
    func convert(amount: Double, from sourceCurrency: Currency, to targetCurrency: Currency) -> Double {
        let exchangeRateToUSD: Double
        
        switch sourceCurrency {
        case .usd:
            exchangeRateToUSD = 1.0
        case .eur:
            exchangeRateToUSD = exchangeRate.usdToEur
        case .brl:
            exchangeRateToUSD = exchangeRate.usdToBrl
        }
        
        let convertedAmountInUSD = amount / exchangeRateToUSD
        
        switch targetCurrency {
        case .usd:
            return convertedAmountInUSD
        case .eur:
            return convertedAmountInUSD * exchangeRate.usdToEur
        case .brl:
            return convertedAmountInUSD * exchangeRate.usdToBrl
        }
    }
}

// Criando uma instância de ExchangeRate com taxas de câmbio de exemplo
let exchangeRate = ExchangeRate(usdToEur: 0.85, usdToBrl: 5.25)

// Criando uma instância de CurrencyConverter
let converter = CurrencyConverter(exchangeRate: exchangeRate)

// Convertendo 100 USD para outras moedas
let amountInUSD: Double = 100
let convertedAmountInEUR = converter.convert(amount: amountInUSD, from: .usd, to: .eur)
let convertedAmountInBRL = converter.convert(amount: amountInUSD, from: .usd, to: .brl)

// Exibindo os resultados
print("\(amountInUSD) \(Currency.usd.symbol) é igual a \(convertedAmountInEUR) \(Currency.eur.symbol)")
print("\(amountInUSD) \(Currency.usd.symbol) é igual a \(convertedAmountInBRL) \(Currency.brl.symbol)")
