import Foundation

//This function accepts an integer n , and returns an nxn array containing a spiral

func spiral(_ n:Int) -> [[Int]] {
    //Initialize the array of arrays with the 'background' character
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    /*
     It will require up to n/4 full passes to complete.
     This will draw the horizontal and vertical pieces clockwise from the top left corner
     After each segment it will check to see if the next segment is neccessary
     
     */
    for pass in 0...n/4{
        //Draw the top line
        if pass*4 == n {break}
        for xCoord in (pass*2)...(n-1-pass*2) {
            result[pass*2][xCoord] = 1
        }
        //Draw the right side
        if pass*4+1 == n {break}
        for yCoord in (pass*2)...(n-1-pass*2){
            result[yCoord][n-1-pass*2] = 1
        }
        //Draw the bottom
        if pass*4+2 == n {break}
        for xCoord in (pass*2)...(n-1-pass*2) {
            result[n-1-pass*2][xCoord] = 1
        }
        //Draw the left side
        if pass*4+3 == n {break}
        for yCoord in (pass*2+2)...(n-1-pass*2){
            result[yCoord][pass*2] = 1
        }
        //Because of the way nested pieces are drawn, this is needed to link loop i to loop i+1
        if pass*4+4 == n {break}
        result[pass*2+2][pass*2+1] = 1
    }
    return result
}
//To see spirals of different size, change the variable n and run the code
var n=8

for row in spiral(n){
    print(row)
}
