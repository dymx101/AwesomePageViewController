//
//  AwesomePageController.swift
//  AwesomePageViewController
//
//  Created by Yiming Dong on 26/09/2017.
//  Copyright © 2017 Yiming Dong. All rights reserved.
//

import UIKit
import Hero

class AwesomePageController: UIViewController {
    
    var pages: [UIView] = [] {
        didSet {
            if pages.count > 0 {
                currentPageIndex = 0
            }
        }
    }
    private var _currentPage: Int = -1
    private var currentPageIndex: Int {
        get {
            return _currentPage
        }
        set {
            if newValue < 0 || newValue > pages.count - 1 {
                _currentPage = -1
            } else {
                _currentPage = newValue
            }
        }
    }
    
    private func hasNextPage() -> Bool {
        return pages.count > 0 && currentPageIndex < pages.count - 1
    }
    
    private func goNextPage() {
        if hasNextPage() {
            let nextPageIndex = currentPageIndex + 1
            let currentPage = pages[currentPageIndex]
            let nextPage = pages[nextPageIndex]
            
            
            view.addSubview(nextPage)
//            nextPage.frame = view.bounds.offsetBy(dx: 0, dy: view.bounds.size.height)
            nextPage.frame = view.bounds
            view.sendSubview(toBack: nextPage)
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
//                nextPage.frame = self.view.bounds
                currentPage.frame = self.view.bounds.offsetBy(dx: 0, dy: -self.view.bounds.size.height)
            }, completion: { (completed) in
                currentPage.removeFromSuperview()
            })
            
            currentPageIndex = nextPageIndex
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isHeroEnabled = true
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(AwesomePageController.tap))
        view.addGestureRecognizer(tapGR)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let currentPage = pages[currentPageIndex]
        view.addSubview(currentPage)
        currentPage.frame = view.bounds
    }
    
    @objc func tap() {
        goNextPage()
    }
}
