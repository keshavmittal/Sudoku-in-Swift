//
//  ViewController.swift
//  Sudoku
//
//  Created by Keshav -MAC on 2016-10-09.
//  Copyright © 2016 Keshav -MAC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    
    @IBOutlet weak var Reset: UIButton!
    @IBOutlet weak var Start: UIButton!
    @IBOutlet weak var Med: UIButton!
    @IBOutlet weak var Hard: UIButton!
    @IBOutlet weak var Check: UIButton!
    
    @IBOutlet weak var ValidateAnswer: UIButton!
    @IBOutlet var Input: [UIButton]!
    var row: Int = 0, column : Int = 0
    var k: Int = 0
    //Kind of a flag to check which level user selected and display results accordingly
    var idn: Int = 0
    
    
    
    private let sectionInsets = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    
    @IBOutlet weak var collectionView: UICollectionView!
    var data = DataModel(numItemsPerRow: 9, initialization: 0)
    private let itemsPerRow = 9
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //number of items to be displayed
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsPerRow*itemsPerRow
    }
    
    //create data
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("DataCell", forIndexPath: indexPath) as! SudokuCollectionViewCell
        var row, column : Int
        (row, column) = getLocation(indexPath)
        cell.Label.text = String(data.get_num(row, column: column))
        if cell.Label.text == "0" {
            cell.Label.hidden = true
        }
        else{
            cell.Label.hidden = false
        }
        
        
        return cell
    }
    
    //cell size specification
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let paddingspace = Int(sectionInsets.left) * itemsPerRow * 2
        let availablewidth = view.frame.width - CGFloat(paddingspace)
        let widthPerItem = availablewidth / CGFloat(itemsPerRow)
        
        return CGSize(width: widthPerItem, height: widthPerItem)
        
    }
    
    //selection behaviour
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        (row, column) = getLocation(indexPath)
    }
    
    func getLocation(indexPath: NSIndexPath) -> (row: Int, column: Int){
        let row: Int = indexPath.row / itemsPerRow
        let column: Int = indexPath.row % itemsPerRow
        return (row, column)
        
    }
    
   

    @IBAction func EasySudoku(sender: AnyObject) {
        data.EasyGrid()
        idn = 1
        collectionView.reloadData()
    }
    
   
    @IBAction func MedSudoku(sender: AnyObject) {
        data.MedGrid()
        idn = 2
        collectionView.reloadData()
    }
    
    
    @IBAction func HardSudoku(sender: AnyObject) {
        data.HardGrid()
        idn = 3
        collectionView.reloadData()
    }
    
    @IBAction func ResetSudoku(sender: AnyObject) {
    data.ResetGrid()
        idn = 4
        collectionView.reloadData()
    }
    
    
    
    //Using one function for all buttons using tag value
    //Using for switch case to update cell values
    //Checking idn value to get which level puzzle user selected
    //calling Fix Functions to stop user from changing already filled Sudoku values
    @IBAction func ButtonClicked(sender: AnyObject) {
        k = sender.tag
        if idn == 1 {
        switch k {
        case 0:
            data.set_num(row, column: column, value: 1)
        case 1:
            data.set_num(row, column: column, value: 2)
        case 2:
            data.set_num(row, column: column, value: 3)
        case 3:
            data.set_num(row, column: column, value: 4)
        case 4:
            data.set_num(row, column: column, value: 5)
        case 5:
            data.set_num(row, column: column, value: 6)
        case 6:
            data.set_num(row, column: column, value: 7)
        case 7:
            data.set_num(row, column: column, value: 8)
        case 8:
            data.set_num(row, column: column, value: 9)
        default:
            data.set_num(row, column: column, value: 0)
        
        }
            data.fixEasyGrid()
     collectionView.reloadData()  }
        
        if idn == 2 {
            switch k {
            case 0:
                data.set_num(row, column: column, value: 1)
            case 1:
                data.set_num(row, column: column, value: 2)
            case 2:
                data.set_num(row, column: column, value: 3)
            case 3:
                data.set_num(row, column: column, value: 4)
            case 4:
                data.set_num(row, column: column, value: 5)
            case 5:
                data.set_num(row, column: column, value: 6)
            case 6:
                data.set_num(row, column: column, value: 7)
            case 7:
                data.set_num(row, column: column, value: 8)
            case 8:
                data.set_num(row, column: column, value: 9)
            default:
                data.set_num(row, column: column, value: 0)
                
            }
            data.fixMidGrid()
            collectionView.reloadData()  }
        if idn == 3 {
            switch k {
            case 0:
                data.set_num(row, column: column, value: 1)
            case 1:
                data.set_num(row, column: column, value: 2)
            case 2:
                data.set_num(row, column: column, value: 3)
            case 3:
                data.set_num(row, column: column, value: 4)
            case 4:
                data.set_num(row, column: column, value: 5)
            case 5:
                data.set_num(row, column: column, value: 6)
            case 6:
                data.set_num(row, column: column, value: 7)
            case 7:
                data.set_num(row, column: column, value: 8)
            case 8:
                data.set_num(row, column: column, value: 9)
            default:
                data.set_num(row, column: column, value: 0)
                
            }
            data.fixHardGrid()
            collectionView.reloadData()  }
        
    }
    
    //This function is to validate whether the player has completed the puzzle or not.
    @IBAction func ValidateAnswer(sender: AnyObject) {
        
        if (idn == 1){
                    if data.nums == data.easyans
                {
                    let alertController = UIAlertController(title: "SUDOKU", message:
                        "You have successfully completed the Puzzle, Please play next level. ", preferredStyle: UIAlertControllerStyle.Alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                
                    }
                    else if data.nums != data.easyans
                    {
                        let alertController = UIAlertController(title: "SUDOKU", message:
                            "Play this Level again. This is the easiest level. Shame on you", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
            }
            
        }
            if (idn == 2){
                    if data.nums == data.medans
                    {
                        let alertController = UIAlertController(title: "SUDOKU", message:
                            "You have successfully completed the Puzzle, Now Try playing Hardest Level. ", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                        
                        
                        
                    }
                    else if data.nums != data.medans
                    {
                        let alertController = UIAlertController(title: "SUDOKU", message:
                            "Play this level again. You can do better.", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                }
                                                                    }

                if (idn == 3){
                    if data.nums == data.hardans
                    {
                        let alertController = UIAlertController(title: "SUDOKU", message:
                            "You have successfully completed all the levels. ", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                        
                        
                        
                    }
                    else if data.nums != data.medans
                    {
                        let alertController = UIAlertController(title: "SUDOKU", message:
                            "Play this Level agian. This is the hardest level, do your best.", preferredStyle: UIAlertControllerStyle.Alert)
                        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                        
                        self.presentViewController(alertController, animated: true, completion: nil)
                        
                        
                        
                    }

                
                
            
                }
    
        if (idn == 4){
            
                let alertController = UIAlertController(title: "SUDOKU", message:
                    "You just pressed Reset button and your checking if your answer is correct or not. Are you idiot! ", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
                
                self.presentViewController(alertController, animated: true, completion: nil)
                
                
                
       
            
            
            
            
        }

    
    }
    
    
    //To Display Answers of Different level Puzzle
    @IBAction func checkResult(sender: AnyObject) {

        if idn == 1 {
        data.Easyans()
                }
    
                if idn == 2 {
                    data.Medans()                        }
    
    
                        if idn == 3 {
                            data.Hardans()
                        }
        if idn == 4 {
            let alertController = UIAlertController(title: "SUDOKU", message:
                "Are you trying to check my Intelligence by checking answer of an Empty Grid", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
collectionView.reloadData()
    }
}

