//
//  ViewController.swift
//  test Stack
//
//  Created by 刘洋博 on 2018/11/15.
//  Copyright © 2018 刘洋博. All rights reserved.
//

import UIKit

struct Stack<T>
{
    fileprivate var array = [T]()
    public var isEmpty: Bool
    {
        return array.isEmpty//是否为空
    }
    public var count: Int
    {
        return array.count
    }
    public mutating func push(_ element: T)
    {
        array.append(element)
    }
    public mutating func pop() -> T?
    {
        return array.popLast()
    }
    public var peak: T?
    {
        return array.last
    }
}
/*struct Stack
{
    fileprivate var array: [String]=[]
    mutating func push(_ element: String)
    {
        array.append(element)
    }
    mutating func pop() -> String?
    {
        return array.popLast()
    }
    func peek() -> String?
    {
        return array.last
    }
}
extension Stack: CustomStringConvertible
{
    var description: String {
        let topDivider = "-----Stack---\n"
        let bottomDivider = "\n----------\n"
        
        let stackElements = array.reversed().joined(separator: "\n")
        return topDivider + stackElements + bottomDivider
    }
}*/

class ViewController: UIViewController {
    var StackDouble = Stack<Double>()
    var StackSymbol = Stack<String>()
    var value1:Double = 0.0
    var value2:Double = 0.0
    var sum:Double = 0.0
    var temp:Int = 0
    var symbol:String = ""
    var isvalue2: Bool = false
    var issecend: Bool = false
    var PointFlag: Bool = false
    
    @IBOutlet weak var value: UITextField!
    @IBOutlet weak var Result: UITextField!
    @IBAction func number1(_ sender: Any) {
        if value.text == "0" || (isvalue2 && value2 == 0.0)
        {
            value.text = ""
            
        }
        value.text = value.text! + "1"
        Result.text = Result.text! + "1"
        if isvalue2
        {
            value2 = NSString(string: value.text!).doubleValue
            value2 = NSString(string: Result.text!).doubleValue
        }
        else
        {
            value1 = NSString(string: value.text!).doubleValue
            value1 = NSString(string: Result.text!).doubleValue
        }
        temp = 1
    }
    @IBAction func number2(_ sender: Any) {
        if value.text == "0" || (isvalue2 && value2 == 0.0)
        {
            value.text = ""
        }
        value.text = value.text! + "2"
        Result.text = Result.text! + "2"
        if isvalue2
        {
            value2 = NSString(string: value.text!).doubleValue
            value2 = NSString(string: Result.text!).doubleValue
        }
        else
        {
            value1 = NSString(string: value.text!).doubleValue
            value1 = NSString(string: Result.text!).doubleValue
        }
        temp = 1
    }
    @IBAction func number3(_ sender: Any) {
        if value.text == "0" || (isvalue2 && value2 == 0.0)
        {
            value.text = ""
        }
        value.text = value.text! + "3"
        Result.text = Result.text! + "3"
        if isvalue2
        {
            value2 = NSString(string: value.text!).doubleValue
            value2 = NSString(string: Result.text!).doubleValue
        }
        else
        {
            value1 = NSString(string: value.text!).doubleValue
            value1 = NSString(string: Result.text!).doubleValue
        }
        temp = 1
    }
    @IBAction func result(_ sender: Any) {
        var str1:String = Result.text!
        
        if isvalue2
        {
            if symbol == "/" && value2 == 0
            {
                print("Error: 除数不能为0")
                return
            }
            switch symbol
            {
            case "+" :
                sum = value1 + value2
            case "-" :
                sum = value1 - value2
            case "*" :
                sum = value1 * value2
            case "/" :
                sum = value1 / value2
            case "^" :
                sum = pow(value1,value2)
            case "√" :
                sum = sqrt(value1)
            default :
                sum = 0.0
            }
            Result.text = sum.description
        }
        print(str1)
    }
    @IBAction func add(_ sender: Any) {
        symbol = "+"
        value.text = value.text!+"+"
        Result.text = Result.text!+"+"
        isvalue2 = true
        sum = value1 + value2
        if sum != 0
        {
            temp = 2
        }
        if temp == 2
        {
            value1 = sum
            value2 = 0.0
        }
        value.text = value1.description
    }
    @IBAction func jian(_ sender: Any) {
        symbol = "-"
        value.text = value.text!+"-"
        Result.text = Result.text!+"-"
        isvalue2 = true
        sum = value1 - value2
        if sum != 0
        {
            temp = 2
        }
        if temp == 2
        {
            value1 = sum
            value2 = 0.0
        }
        value.text = value1.description
    }
    @IBAction func cheng(_ sender: Any) {
        symbol = "*"
        value.text = value.text!+"×"
        Result.text = Result.text!+"*"
        isvalue2 = true
        sum = value1 * value2
        if sum != 0
        {
            temp = 2
        }
        if temp == 2
        {
            value1 = sum
            value2 = 0.0
        }
        value.text = value1.description
    }
    @IBAction func chu(_ sender: Any) {
        symbol = "/"
        value.text = value.text!+"÷"
        Result.text = Result.text!+"÷"
        isvalue2 = true
        if value2 == 0
        {
            value2 = 1
        }
        sum = value1 / value2
        if sum != 0
        {
            temp = 2
        }
        if temp == 2
        {
            value1 = sum
            value2 = 0.0
        }
        value.text = value1.description
    }
    @IBAction func allclear(_ sender: Any) {
        value.text = "0"
        Result.text = ""
        value1 = 0.0
        value2 = 0.0
        PointFlag = false
        isvalue2 = false
        symbol = ""
        temp = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

