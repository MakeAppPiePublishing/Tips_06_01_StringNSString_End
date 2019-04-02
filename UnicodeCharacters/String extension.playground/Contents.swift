
//:# Secret Bonus! Some more string stuff
//: We'll cover this is a later episode, but in case you are dying to know what you can do with all this in a string, I've created a simple extention to `String` that will let you use three more common `String` functions.
//: You can copy this to a iPad playground or select *Editor> ShowRenderedMarkup* to show formatting of the comments.

//: First make the extension
extension String{
//:As we already learned, `index` starts at 1 and not zero. I like keeping cosistent with arrays, so I'll write a function to return a valid position. This make sure we are in range. I also set overflows to `startIndex` and `endIndex`. I did this for speed in coding the rest of this. This would be better returning `Int!` and checking for `nil`.
    private func pos(position:Int)->Int{
        var pos = position
        if pos > 0 {pos -= 1} else {pos = 0}
        if pos >= count {pos = count - 1}
        return pos
    }
//:I'll need the position of the character I'm interested in. I made another function for that, using the `offsetBy` we already used. Since this is an extension of `String`, I use `self` for the object.
    private func index(_ position:Int)->String.Index{
        return self.index(startIndex, offsetBy: pos(position:position))
    }
    
//:I'll make the the character return similar to what we did earlier in a `NSString` function. Again, the string here is `self`
    func character(at position:Int)->Character{
        return self[index(position)]
    }
//:All the characters to the left of the position I make an open range based on position to get a left string function.
    func leftString(from position:Int)-> String{
        return String(self[...index(position)])
    }
//: For a string starting at one character position and going for a length, I use a closed range of `postion` and `endPosition`. I calcualte the end by adding the length, but still have to take 1 off.
    func midString(from position:Int, length:Int)-> String{
        let endPosition = position + length - 1
        return String(self[index(position)...index(endPosition)])
    }
//: Getting the rightmost characters is a little bit more difficult. `rightIndex` has to be from the trailing side. So I'll find the position by subtracting `position` from `endIndex` or `self.endIndex` if you want to be more accurate.
    func rightString(from position:Int)-> String{
        let rightIndex = self.index(endIndex, offsetBy: -pos(position:position + 1))
        return String(self[rightIndex...])
    }
    
}
//:Now to test all this with a string with extended grapheme cluster

var yummy = "D\u{1f369}ugh\u{20d7}n\u{20ed}uts"

yummy.character(at: 3)
yummy.leftString(from: 3)
yummy.midString(from: 3, length: 3)
yummy.rightString(from: 3)

