//
//  ViewController.swift
//  test Stack
//
//  Created by 刘洋博 on 2018/11/15.
//  Copyright © 2018 刘洋博. All rights reserved.
//

import UIKit

public struct Stack<T>
{
    fileprivate var array = [T]()
    public var isEmpty: Bool
    {
        return array.isEmpty
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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

