//
//  ContentViewController.swift
//  AwesomePageViewController
//
//  Created by Yiming Dong on 26/09/2017.
//  Copyright © 2017 Yiming Dong. All rights reserved.
//

import UIKit

class ContentView: UIView {

    private var _text: String = ""
    var label : UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        doInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        doInit()
    }
    
    func doInit() {
        backgroundColor = getRandomColor()
        
        label = UILabel(frame: bounds)
        addSubview(label)
        label.font = UIFont.systemFont(ofSize: 28)
        label.textColor = UIColor.white
        label.numberOfLines = 0
        
        label.text = "asdjhasjdhjsagdjhgasjhdgjhasgdjhagsdjhgashjdgsahjdgjashgdjhasgdhjagjsdhgasjasdjhasjdhjsagdjhgasjhdgjhasgdjhagsdjhgashjdgsahjdgjashgdjhasgdhjagjsdhgasj"
    }

    func getRandomColor() -> UIColor{
        //Generate between 0 to 1
        let red:CGFloat = CGFloat(drand48()) / 2
        let green:CGFloat = CGFloat(drand48()) / 2
        let blue:CGFloat = CGFloat(drand48()) / 2
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }

}
