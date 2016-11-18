//
//  DataModel.swift
//  Sudoku
//
//  Created by Keshav -MAC on 2016-10-09.
//  Copyright © 2016 Keshav -MAC. All rights reserved.
//

import Foundation

class DataModel {
    
    var nums: [[Int]] = []
    var easyque: [[Int]] = []
    var easyans: [[Int]] = []
    var medque: [[Int]] = []
    var medans: [[Int]] = []
    var hardque: [[Int]] = []
    var hardans: [[Int]] = []
    
    init(numItemsPerRow: Int, initialization: Int)
    {
        nums = Array(count: numItemsPerRow, repeatedValue: Array(count: numItemsPerRow, repeatedValue: initialization))
        
        
    }
    
    
    
    
    func get_num(row:Int, column:Int) -> Int{
        return nums[row][column]
    }
    
    func set_num(row:Int, column:Int, value:Int){
        nums[row][column] = value
    }
    
    func ResetGrid() {
        for i in nums.indices{
            for j in nums.indices{
                if nums[i][j] != 0 {
                    repeat{
                        nums[i][j] = Int(arc4random() % 10)
                    } while (nums[i][j] != 0)            }
            }
        }
        
        
    }
    
   //Easy level Sudoku
    func EasyGrid(){
        nums = [[5,6,0,0,0,0,0,7,0],
                [7,9,0,0,0,2,0,6,8],
                [0,0,0,0,7,8,0,0,0],
                [0,0,0,5,8,0,7,2,3],
                [3,0,0,7,0,1,6,8,4],
                [0,8,7,0,3,6,0,0,0],
                [0,0,0,8,6,0,2,0,0],
                [8,5,0,0,2,0,0,4,7],
                [0,0,0,0,4,0,0,3,6]]
    }
    //Solution for Easy
    func Easyans(){
        nums = [[5,6,8,3,1,9,4,7,2],
                [7,9,1,4,5,2,3,6,8],
                [2,3,4,6,7,8,5,9,1],
                [6,1,9,5,8,4,7,2,3],
                [3,2,5,7,9,1,6,8,4],
                [4,8,7,2,3,6,9,1,5],
                [1,4,3,8,6,7,2,5,9],
                [8,5,6,9,2,3,1,4,7],
                [9,7,2,1,4,5,8,3,6]]
        easyans = nums
    }
    
    //Medium Level Sudoku
    func MedGrid(){
        
        nums = [[0,0,3,9,0,0,7,6,0],
                [0,4,0,0,0,6,0,0,9],
                [6,0,7,0,1,0,0,0,4],
                [2,0,0,6,7,0,0,9,0],
                [0,0,4,3,0,5,6,0,0],
                [0,1,0,0,4,9,0,0,7],
                [7,0,0,0,9,0,2,0,1],
                [3,0,0,2,0,0,0,4,0],
                [0,2,9,0,0,8,5,0,0]]
    
                 }
    
    //Solution for Medium
    func Medans(){
        nums = [[1,5,3,9,8,4,7,6,2],
                [8,4,2,7,3,6,1,5,9],
                [6,9,7,5,1,2,8,3,4],
                [2,3,8,6,7,1,4,9,5],
                [9,7,4,3,2,5,6,1,8],
                [5,1,6,8,4,9,3,2,7],
                [7,6,5,4,9,3,2,8,1],
                [3,8,1,2,5,7,9,4,6],
                [4,2,9,1,6,8,5,7,3]]
        medans = nums
    }
    //Hard Level Sudoku
    func HardGrid(){
        nums = [[0,8,7,2,0,0,0,5,0],
                [6,0,4,0,0,0,1,0,0],
                [3,0,0,0,9,5,0,8,0],
                [8,0,0,0,1,9,0,0,0],
                [0,0,0,4,0,6,0,0,0],
                [0,0,0,8,7,0,0,0,0],
                [0,3,0,9,6,0,0,0,2],
                [0,0,2,0,0,0,9,0,7],
                [0,7,0,0,0,2,3,0,0]]
    }
  
    
    
   
    
    //Solution for Hard
    func Hardans(){
        nums = [[9,8,7,2,4,1,6,5,3],
                   [6,5,4,7,3,8,1,2,9],
                   [3,2,1,6,9,5,7,8,4],
                   [8,4,3,5,1,9,2,7,6],
                   [7,9,5,4,2,6,8,3,1],
                   [2,1,6,8,7,3,4,9,5],
                   [1,3,8,9,6,7,5,4,2],
                   [5,6,2,3,8,4,9,1,7],
                   [4,7,9,1,5,2,3,6,8]]
    hardans = nums
    }
    
    //To stop user to change values of already provided values for Easy Sudoku
    func fixEasyGrid() {
    nums[0][0] = 5
    nums[0][1] = 6
    nums[0][7] = 7
    nums[1][0] = 7
    nums[1][1] = 9
    nums[1][5] = 2
    nums[1][7] = 6
    nums[1][8] = 8
    nums[2][4] = 7
    nums[2][5] = 8
    nums[3][3] = 5
    nums[3][4] = 8
    nums[3][6] = 7
    nums[3][7] = 2
    nums[3][8] = 3
    nums[4][0] = 3
    nums[4][3] = 7
    nums[4][5] = 1
    nums[4][6] = 6
    nums[4][7] = 8
    nums[4][8] = 4
    nums[5][1] = 8
    nums[5][2] = 7
    nums[5][4] = 3
    nums[5][5] = 6
    nums[6][3] = 8
    nums[6][4] = 6
    nums[6][6] = 2
    nums[7][0] = 8
    nums[7][1] = 5
    nums[7][4] = 2
    nums[7][7] = 4
    nums[7][8] = 7
    nums[8][4] = 4
    nums[8][7] = 3
    nums[8][8] = 6
    }
    
    //To stop user to change values of already provided values for  Medium Sudoku
    func fixMidGrid() {
        nums[0][2] = 3
        nums[0][3] = 9
        nums[0][6] = 7
        nums[0][7] = 6
        nums[1][1] = 4
        nums[1][5] = 6
        nums[1][8] = 9
        nums[2][0] = 6
        nums[2][2] = 7
        nums[2][4] = 1
        nums[2][8] = 4
        nums[3][0] = 2
        nums[3][3] = 6
        nums[3][4] = 7
        nums[3][7] = 9
        nums[4][2] = 4
        nums[4][3] = 3
        nums[4][5] = 5
        nums[4][6] = 6
        nums[5][1] = 1
        nums[5][4] = 4
        nums[5][5] = 9
        nums[5][8] = 7
        nums[6][0] = 7
        nums[6][4] = 9
        nums[6][6] = 2
        nums[6][8] = 1
        nums[7][0] = 3
        nums[7][3] = 2
        nums[7][7] = 4
        nums[8][1] = 2
        nums[8][2] = 9
        nums[8][5] = 8
        nums[8][6] = 5

    }
    
      //To stop user to change values of already provided values for  Hard Sudoku
    func fixHardGrid() {
    nums[0][1] = 8
    nums[0][2] = 7
    nums[0][3] = 2
    nums[0][7] = 5
    nums[1][0] = 6
    nums[1][2] = 4
    nums[1][6] = 1
    nums[2][0] = 3
    nums[2][4] = 9
    nums[2][5] = 5
    nums[2][7] = 8
    nums[3][0] = 8
    nums[3][4] = 1
    nums[3][5] = 9
    nums[4][3] = 4
    nums[4][5] = 6
    nums[5][3] = 8
    nums[5][4] = 7
    nums[6][1] = 3
    nums[6][3] = 9
    nums[6][4] = 6
    nums[6][8] = 2
    nums[7][2] = 2
    nums[7][6] = 9
    nums[7][8] = 7
    nums[8][1] = 7
    nums[8][5] = 2
    nums[8][6] = 3
    }


}
