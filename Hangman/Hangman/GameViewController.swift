//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet var Reset: UIBarButtonItem!
    @IBOutlet var Image: UIImageView!
    @IBOutlet weak var Phrase: UILabel!
    @IBOutlet weak var WrongGuesses: UILabel!
    @IBOutlet var Q: UIButton!
    @IBOutlet var W: UIButton!
    @IBOutlet var E: UIButton!
    @IBOutlet var R: UIButton!
    @IBOutlet var T: UIButton!
    @IBOutlet var Y: UIButton!
    @IBOutlet var U: UIButton!
    @IBOutlet var I: UIButton!
    @IBOutlet var O: UIButton!
    @IBOutlet var P: UIButton!
    @IBOutlet var A: UIButton!
    @IBOutlet var S: UIButton!
    @IBOutlet var D: UIButton!
    @IBOutlet var F: UIButton!
    @IBOutlet var G: UIButton!
    @IBOutlet var H: UIButton!
    @IBOutlet var J: UIButton!
    @IBOutlet var K: UIButton!
    @IBOutlet var L: UIButton!
    @IBOutlet var Z: UIButton!
    @IBOutlet var X: UIButton!
    @IBOutlet var C: UIButton!
    @IBOutlet var V: UIButton!
    @IBOutlet var B: UIButton!
    @IBOutlet var N: UIButton!
    @IBOutlet var M: UIButton!
    
    var gamePhrase:String = ""
    var phraseGuessString: String = ""
    var numWrongGuesses: Int = 0
    var wrongLetters: String = ""
    
    @IBAction func unwindToGame(segue: UIStoryboardSegue){
        //self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        let hangmanPhrases = HangmanPhrases()
        gamePhrase = hangmanPhrases.getRandomPhrase().uppercaseString
        phraseGuessString = ""
        for char in gamePhrase.characters {
            if char == " "{
                phraseGuessString += " "
            } else {
                phraseGuessString += "-"
            }
        }
        
        Phrase.text = phraseGuessString
                
        Q.addTarget(self, action: "QCheck", forControlEvents: UIControlEvents.TouchUpInside)
        W.addTarget(self, action: "WCheck", forControlEvents: UIControlEvents.TouchUpInside)
        E.addTarget(self, action: "ECheck", forControlEvents: UIControlEvents.TouchUpInside)
        R.addTarget(self, action: "RCheck", forControlEvents: UIControlEvents.TouchUpInside)
        T.addTarget(self, action: "TCheck", forControlEvents: UIControlEvents.TouchUpInside)
        Y.addTarget(self, action: "YCheck", forControlEvents: UIControlEvents.TouchUpInside)
        U.addTarget(self, action: "UCheck", forControlEvents: UIControlEvents.TouchUpInside)
        I.addTarget(self, action: "ICheck", forControlEvents: UIControlEvents.TouchUpInside)
        O.addTarget(self, action: "OCheck", forControlEvents: UIControlEvents.TouchUpInside)
        P.addTarget(self, action: "PCheck", forControlEvents: UIControlEvents.TouchUpInside)
        A.addTarget(self, action: "ACheck", forControlEvents: UIControlEvents.TouchUpInside)
        S.addTarget(self, action: "SCheck", forControlEvents: UIControlEvents.TouchUpInside)
        D.addTarget(self, action: "DCheck", forControlEvents: UIControlEvents.TouchUpInside)
        F.addTarget(self, action: "FCheck", forControlEvents: UIControlEvents.TouchUpInside)
        G.addTarget(self, action: "GCheck", forControlEvents: UIControlEvents.TouchUpInside)
        H.addTarget(self, action: "HCheck", forControlEvents: UIControlEvents.TouchUpInside)
        J.addTarget(self, action: "JCheck", forControlEvents: UIControlEvents.TouchUpInside)
        K.addTarget(self, action: "KCheck", forControlEvents: UIControlEvents.TouchUpInside)
        L.addTarget(self, action: "LCheck", forControlEvents: UIControlEvents.TouchUpInside)
        M.addTarget(self, action: "MCheck", forControlEvents: UIControlEvents.TouchUpInside)
        N.addTarget(self, action: "NCheck", forControlEvents: UIControlEvents.TouchUpInside)
        B.addTarget(self, action: "BCheck", forControlEvents: UIControlEvents.TouchUpInside)
        V.addTarget(self, action: "VCheck", forControlEvents: UIControlEvents.TouchUpInside)
        C.addTarget(self, action: "CCheck", forControlEvents: UIControlEvents.TouchUpInside)
        X.addTarget(self, action: "XCheck", forControlEvents: UIControlEvents.TouchUpInside)
        Z.addTarget(self, action: "ZCheck", forControlEvents: UIControlEvents.TouchUpInside)

    }
    
    
    
    func letterCheck(char: Character) -> Void{
        print(char)
        var inWord = false
        for charIndex in 1...gamePhrase.characters.count{
            if (Array(gamePhrase.characters)[charIndex - 1] == char) {
                phraseGuessString = replace(phraseGuessString, index: charIndex-1, newChar: char)
                inWord = true
            }
        }
        if (!inWord){
            numWrongGuesses += 1
            Image.image = UIImage(named: "hangman" + String(numWrongGuesses + 1) + ".gif")
            wrongLetters += String(char)
            wrongLetters += "  "
            WrongGuesses.text = wrongLetters
            if (numWrongGuesses > 5){
                let loseAlert = UIAlertController(title: "Game Over", message: "Play another?", preferredStyle: UIAlertControllerStyle.Alert)
                loseAlert.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.Default, handler: newGame))
                self.presentViewController(loseAlert, animated: true, completion: nil)

            }
        }
        Phrase.text = phraseGuessString
        
        //WIN CONDITION
        if phraseGuessString == gamePhrase{
            let winAlert = UIAlertController(title: "Nice Win!", message: "Play another?", preferredStyle: UIAlertControllerStyle.Alert)
            winAlert.addAction(UIAlertAction(title:"OK", style: UIAlertActionStyle.Default, handler: newGame))
            self.presentViewController(winAlert, animated: true, completion: nil)

        }
    }
    
    func replace(myString: String, index: Int, newChar: Character)-> String {
        var chars = Array(myString.characters)     // gets an array of characters
        chars[index] = newChar
        let modifiedString = String(chars)
        return modifiedString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func newGame(alert: UIAlertAction!){
        
        self.performSegueWithIdentifier("StartNew", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func QCheck(){
        if !(Q.backgroundColor == UIColor.grayColor()){
            letterCheck("Q")
            Q.backgroundColor = UIColor.grayColor()
        }
    }
    
    func WCheck(){
        if !(W.backgroundColor == UIColor.grayColor()){
            letterCheck("W")
            W.backgroundColor = UIColor.grayColor()
        }
    }
    
    func ECheck(){
        if !(E.backgroundColor == UIColor.grayColor()){
            letterCheck("E")
            E.backgroundColor = UIColor.grayColor()
        }
    }
    
    func RCheck(){
        if !(R.backgroundColor == UIColor.grayColor()){
            letterCheck("R")
            R.backgroundColor = UIColor.grayColor()
        }
    }
    
    func TCheck(){
        if !(T.backgroundColor == UIColor.grayColor()){
            letterCheck("T")
            T.backgroundColor = UIColor.grayColor()
        }
    }
    
    func YCheck(){
        if !(Y.backgroundColor == UIColor.grayColor()){
            letterCheck("Y")
            Y.backgroundColor = UIColor.grayColor()
        }
    }
    
    func UCheck(){
        if !(U.backgroundColor == UIColor.grayColor()){
            letterCheck("U")
            U.backgroundColor = UIColor.grayColor()
        }
    }
    
    func ICheck(){
        if !(I.backgroundColor == UIColor.grayColor()){
            letterCheck("I")
            I.backgroundColor = UIColor.grayColor()
        }
    }
    
    func OCheck(){
        if !(O.backgroundColor == UIColor.grayColor()){
            letterCheck("O")
            O.backgroundColor = UIColor.grayColor()
        }
    }
    
    func PCheck(){
        if !(P.backgroundColor == UIColor.grayColor()){
            letterCheck("P")
            P.backgroundColor = UIColor.grayColor()
        }
    }
    
    func ACheck(){
        if !(A.backgroundColor == UIColor.grayColor()){
            letterCheck("A")
            A.backgroundColor = UIColor.grayColor()
        }
    }
    
    func SCheck(){
        if !(S.backgroundColor == UIColor.grayColor()){
            letterCheck("S")
            S.backgroundColor = UIColor.grayColor()
        }
    }
    
    func DCheck(){
        if !(D.backgroundColor == UIColor.grayColor()){
            letterCheck("D")
            D.backgroundColor = UIColor.grayColor()
        }
    }
    
    func FCheck(){
        if !(F.backgroundColor == UIColor.grayColor()){
            letterCheck("F")
            F.backgroundColor = UIColor.grayColor()
        }    }
    
    func GCheck(){
        if !(G.backgroundColor == UIColor.grayColor()){
            letterCheck("G")
            G.backgroundColor = UIColor.grayColor()
        }
    }
    
    func HCheck(){
        if !(H.backgroundColor == UIColor.grayColor()){
            letterCheck("H")
            H.backgroundColor = UIColor.grayColor()
        }
    }
    
    func JCheck(){
        if !(J.backgroundColor == UIColor.grayColor()){
            letterCheck("J")
            J.backgroundColor = UIColor.grayColor()
        }
    }
    
    func KCheck(){
        if !(K.backgroundColor == UIColor.grayColor()){
            letterCheck("K")
            K.backgroundColor = UIColor.grayColor()
        }
    }
    
    func LCheck(){
        if !(L.backgroundColor == UIColor.grayColor()){
            letterCheck("L")
            L.backgroundColor = UIColor.grayColor()
        }
    }
    
    func ZCheck(){
        if !(Z.backgroundColor == UIColor.grayColor()){
            letterCheck("Z")
            Z.backgroundColor = UIColor.grayColor()
        }
    }
    
    func XCheck(){
        if !(X.backgroundColor == UIColor.grayColor()){
            letterCheck("X")
            X.backgroundColor = UIColor.grayColor()
        }
    }
    
    func CCheck(){
        if !(C.backgroundColor == UIColor.grayColor()){
            letterCheck("C")
            C.backgroundColor = UIColor.grayColor()
        }
    }
    
    func VCheck(){
        if !(V.backgroundColor == UIColor.grayColor()){
            letterCheck("V")
            V.backgroundColor = UIColor.grayColor()
        }
    }
    
    func BCheck(){
        if !(B.backgroundColor == UIColor.grayColor()){
            letterCheck("B")
            B.backgroundColor = UIColor.grayColor()
        }
    }
    
    func NCheck(){
        if !(N.backgroundColor == UIColor.grayColor()){
            letterCheck("N")
            N.backgroundColor = UIColor.grayColor()
        }
    }
    
    func MCheck(){
        if !(M.backgroundColor == UIColor.grayColor()){
            letterCheck("M")
            M.backgroundColor = UIColor.grayColor()
        }
    }

}
