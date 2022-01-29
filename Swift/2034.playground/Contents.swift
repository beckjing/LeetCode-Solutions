import UIKit

class StockPrice {
    
    var nodeDic = Dictionary<Int, Int>()
    var currentTime: Int = 0
    var minPrice = (0, 0)
    var maxPrice = (0, 0)
    
    init() {
        
    }
    
    func update(_ timestamp: Int, _ price: Int) {
        self.nodeDic[timestamp] = price
        if self.currentTime == 0 {
            self.minPrice = (timestamp, price)
            self.maxPrice = (timestamp, price)
        }
        else {
            if timestamp == self.minPrice.0 || timestamp == self.maxPrice.0 {
                var min = self.nodeDic.first
                var max = self.nodeDic.first
                for (k, v) in self.nodeDic {
                    if v < min!.value {
                        min!.key = k
                        min!.value = v
                    }
                    if v > max!.value {
                        max?.key = k
                        max?.value = v
                    }
                }
                self.maxPrice = (max!.key, max!.value)
                self.minPrice = (min!.key, min!.value)
            }
            else {
                if price > self.maxPrice.1 {
                    self.maxPrice = (timestamp, price)
                }
                if price < self.minPrice.1 {
                    self.minPrice = (timestamp, price)
                }
            }
        }
        self.currentTime = max(timestamp, self.currentTime)
    }
    
    func current() -> Int {
        return self.nodeDic[self.currentTime]!
    }
    
    func maximum() -> Int {
        return self.maxPrice.1
    }
    
    func minimum() -> Int {
        return self.minPrice.1
    }
}
