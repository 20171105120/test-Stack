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
public func Isnumber(number:Character)->Bool
{
    if number >= "0" && number <= "9"
    {
        return true;
    }
    else
    {
        return false;
    }
}
public func Issymbol(symbol:Character)->Bool
{
    if symbol == "+" || symbol == "-" || symbol == "*" || symbol == "/" || symbol == "(" || symbol == ")"
    {
        return true;
    }
    else
    {
        return false;
    }
}
public func OperatorPriority(opp:Character)->Int
{
    //运算优先级判断
    switch opp
    {
    case "#":
        return 0
    case "(":
        return 1
    case "+":
        return 2
    case "-":
        return 2
    case "*":
        return 3
    case "/":
        return 3
    case ")":
        return 4
    default:
        return -1
    }
}
class ViewController: UIViewController {
    var StackDouble = Stack<Double>()
    var StackSymbol = Stack<String>()
    var value1:Double = 0.0
    var value2:Double = 0.0
    var sum1:Double = 0.0
    var sum2:Double = 0.0
    var num1:Double = 0.0
    var num2:Double = 0.0
    var temp:Int = 0
    var symbol:String = ""
    var isvalue2: Bool = false
    var issecend: Bool = false
    var PointFlag: Bool = false

public func CutString()
{
    let str1 = Result.text!
    for inf in str1
    {
        if Isnumber(number: inf)
        {
            let valid = String(inf)
            StackDouble.push(Double(valid)!)
        }
        if Issymbol(symbol: inf)
        {
            let Issym = String(inf)
            StackSymbol.push(Issym)
        }
    }
}
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
        }
        else
        {
            value1 = NSString(string: value.text!).doubleValue
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
        }
        else
        {
            value1 = NSString(string: value.text!).doubleValue
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
        }
        else
        {
            value1 = NSString(string: value.text!).doubleValue
        }
        temp = 1
    }
    @IBAction func result(_ sender: Any) {
        CutString()
        if isvalue2
        {
            if symbol == "/" && value2 == 0
            {
                print("Error: 除数不能为0")
                return
            }
            num1 = StackDouble.pop()!
            num2 = StackDouble.pop()!
            if(StackSymbol.pop() == "+")
            {
                sum2 = num1 + num2
            }
            if(StackSymbol.pop() == "-")
            {
                sum2 = num2 - num1
            }
            if(StackSymbol.pop() == "*")
            {
                sum2 = num2 * num1
            }
            if(StackSymbol.pop() == "÷")
            {
                sum2 = num2 / num1
            }
            StackDouble.push(sum2)
            switch symbol
            {
            case "+" :
                sum1 = value1 + value2
            case "-" :
                sum1 = value1 - value2
            case "*" :
                sum1 = value1 * value2
            case "/" :
                sum1 = value1 / value2
            case "^" :
                sum1 = pow(value1,value2)
            case "√" :
                sum1 = sqrt(value1)
            default :
                sum1 = 0.0
            }
            value.text = sum1.description
            Result.text = sum2.description
        }
        print(value1)
        print(value2)
        print(sum1)
        var a = StackDouble.pop()
        print(a)
        a = StackDouble.pop()
        print(a)
        a = StackDouble.pop()
        print(a)
        var b = StackSymbol.pop()
        print(b)
        b = StackSymbol.pop()
        print(b)
    }
    @IBAction func add(_ sender: Any) {
        symbol = "+"
        value.text = value.text!+"+"
        Result.text = Result.text!+"+"
        isvalue2 = true
        sum1 = value1 + value2
        if sum1 != 0
        {
            temp = 2
        }
        if temp == 2
        {
            value1 = sum1
            value2 = 0.0
        }
        value.text = value1.description
    }
    @IBAction func jian(_ sender: Any) {
        symbol = "-"
        value.text = value.text!+"-"
        Result.text = Result.text!+"-"
        isvalue2 = true
        sum1 = value1 - value2
        if sum1 != 0
        {
            temp = 2
        }
        if temp == 2
        {
            value1 = sum1
            value2 = 0.0
        }
        value.text = value1.description
    }
    @IBAction func cheng(_ sender: Any) {
        symbol = "*"
        value.text = value.text!+"×"
        Result.text = Result.text!+"*"
        isvalue2 = true
        sum1 = value1 * value2
        if sum1 != 0
        {
            temp = 2
        }
        if temp == 2
        {
            value1 = sum1
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
        sum1 = value1 / value2
        if sum1 != 0
        {
            temp = 2
        }
        if temp == 2
        {
            value1 = sum1
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

