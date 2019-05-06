func gta(limit: Int, args:[Int]) -> Int {
    var sum : Int = 0
    var masterIntList: [Int] = []
    var counter = 1
    var multiplier = 0
    
    
    // This function will check to see if there is a digit n spaces from the left
    // of the number.  If so, it returns that digit.  If not, or if that digit it
    // already exists in the masterIntList, it returns '20'
    func leftMost(toSkim: String, atIndex: Int) -> Int{
        let result = 20
        if toSkim.count<atIndex {return result}
        let valIndex = toSkim.index(toSkim.startIndex, offsetBy: atIndex-1)
        let val = Int(String(toSkim[valIndex]))
        if masterIntList.contains(val!) {return result}
        return val!
    }
    
    // This function accepts an integer 'n' and returns n!
    func fact(_ n: Int) -> Int {
        var result = 1
        if n<2 {return result}
        for num in 2...n{
            result *= num
        }
        return result
    }
    
    // This function calculates nPr, or the number of ways r objects can be
    // chosen from n where order matters
    func nPr(n: Int, r: Int) -> Int {
        print("\(n)P\(r) = \((fact(n)/fact(n-r)))")
        return (fact(n)/fact(n-r))
    }
    
    // This loop builds the list of integers by skimming off the left-most digit
    // and adding them to the list.  The function returns '20' if there is no
    // digit present or if the digit is already in the list - those returns are unused
    while masterIntList.count<limit {
        for check in args{
            let lmost = leftMost(toSkim: String(check), atIndex: counter)
            if lmost != 20 {masterIntList.append(lmost)}
            if !(masterIntList.count<limit) { break}
        }
        counter += 1
    }
    
    // this sums up the number of ways to permute n objects
    for choose in 1...limit{
        multiplier += nPr(n: limit, r: choose)*choose/limit
    }
    
    for element in masterIntList {
        sum += element*multiplier
    }
    
    return sum
}
