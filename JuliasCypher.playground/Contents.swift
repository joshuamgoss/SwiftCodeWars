import Cocoa

let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"

//This is designed to encode and decode messages using a variation of the Julias cypher

func movingShift(_ s: String, _ shift: Int) {
    var encoded: String = ""
    var currentShift = shift
    //Iterate over the list and encode the letter values
    for toEncode in s {
        if letters.contains(toEncode){
            //append coded letters as they are found, and advance the shift amount
            encoded += shiftCharacters(shift: currentShift, char: String(toEncode))
            currentShift += 1
        }else{
            //non-letter characters are not encoded and do not affect the shift amount
            encoded += String(toEncode)
        }
    }
    print(encoded)
    //return splitToFivePieces(encodedString: encoded)
}
//TODO: Write splitToFivePieces that accepts the encoded string, and formats them 

//TODO: Write the shift function: It accepts the letter to encode and the shift amount

//Decrypting function
func demovingShift(_ arr: [String], _ shift: Int) -> String {
    //initialize the variables and convert the input into something easier to work with
    var decoded: String = ""
    var currentShift = shift
    let message = arr.joined()
    //Iterate over the encoded message
    for toDecode in message {
        if letters.contains(toDecode){
            //Decode the letter and add it to the result string, then advance the shift amount
            decoded += shiftCharacters(shift: 26-currentShift, char: String(toDecode))
            currentShift += 1
        }else{
            //Nothing gets encoded to a non-letter character, so non-letter characters stay the same and do not advance the shift amount
            decoded += String(toDecode)
        }
    }
    return decoded
}
