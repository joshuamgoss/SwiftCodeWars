import Foundation

class Dartboard {
    
    func getScore(dart: (x: Double, y: Double)) -> String {
        let x = dart.x
        let y = dart.y
        var sliceVal = ""
        
        // Pythagorean theorem to find distance from center of target
        let distance = (x*x+y*y).squareRoot()

        // Using arctan and whether the number is positive or negative to convert coordinates to direction
        let rotateBy = x<0 ? 180.0 : 0.0
        let direction = 90-(atan(y/x))*180/Double.pi + rotateBy
        
        // Determine the slice in which the dart landed.
        let sliceScores: [Int] = [20, 1, 18, 4, 13, 6, 10, 15, 2, 17, 3, 19, 7, 16, 8, 11, 14, 9, 12, 5, 20]
        sliceVal = String(sliceScores[Int(direction+9.0)/18])
        
        // Determine the ring in which the dart landed to get the multiplier.  Return it as a string
        if distance<12.7/2{
            return "DB"
        }else if distance<31.8/2{
            return "SB"
        }else if distance<198.0/2{
            return sliceVal
        }else if distance<214.0/2{
            return "T"+sliceVal
        }else if distance<324.0/2{
            return sliceVal
        }else if distance<340.0/2{
            return "D"+sliceVal
        }else{
            return "X"
        }
    }
}

