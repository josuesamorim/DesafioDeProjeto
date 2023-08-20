import Foundation

func calculateCompoundInterest(principal: Float, rate: Float, time: Int) -> Float {
    var compoundInterest = principal
    for _ in 0..<time {
        compoundInterest *= (1 + rate)
    }
    return compoundInterest
}

let principalAmount: Float = 20000.0 // Valor principal
let annualInterestRate: Float = 0.04 // Taxa de juros anual
let timeInYears: Int = 10 // Tempo em anos

let finalAmount = calculateCompoundInterest(principal: principalAmount, rate: annualInterestRate, time: timeInYears)

let integerPart = Int(finalAmount)
let fractionalPart = Int((finalAmount - Float(integerPart)) * 100)

let formattedAmount = "R$ \(integerPart).\(String(format: "%02d", fractionalPart))"

print("Valor final do investimento:", formattedAmount)
