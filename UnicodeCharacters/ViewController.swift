//
//  A Demo for iOS Development Tips Weekly
//  by Steven Lipton (C)2018, All rights reserved
//  For videos go to http://bit.ly/TipsLinkedInLearning
//  For code go to http://bit.ly/AppPieGithub
//🍩

import UIKit

class ViewController: UIViewController {
    var yummy = "D\u{1f369}ugh\u{20d7}n\u{20ed}uts"

    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //yummy = "\u{1f369}"
        //yummy = "Bun\u{0303}elos"
        let nsYummy = NSString(string: yummy)
        label.text = yummy + String(format:"\n %i %i",yummy.count,nsYummy.length)
        let yummyChar = yummy[yummy.index(yummy.startIndex, offsetBy: 3)]
        print(yummyChar)
        let nsYummyChar = nsYummy.character(at: 4)
        print(String(format: "%X %C", nsYummyChar,nsYummyChar))
        
        for index in 0..<nsYummy.length{
            let nsYummyChar = nsYummy.character(at: index)
             print(String(format: "%X %C", nsYummyChar,nsYummyChar))
        }
        
        for char in yummy{
            print(String(char))
        }
        
    }

}

