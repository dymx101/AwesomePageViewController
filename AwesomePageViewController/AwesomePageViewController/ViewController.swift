//
//  ViewController.swift
//  AwesomePageViewController
//
//  Created by Yiming Dong on 26/09/2017.
//  Copyright © 2017 Yiming Dong. All rights reserved.
//

import UIKit
import Hero

class ViewController: UIViewController {
    
    var pageController: AwesomePageController!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pages = [
            ContentView(frame:view.bounds),
            ContentView(frame:view.bounds),
            ContentView(frame:view.bounds),
            ContentView(frame:view.bounds),
            ContentView(frame:view.bounds),
            ContentView(frame:view.bounds),
            ContentView(frame:view.bounds),
            ContentView(frame:view.bounds)
                     ]
        pageController = AwesomePageController()
        pageController.pages = pages
    }
    
    
    @IBAction func showAction(_ sender: Any) {
//        isHeroEnabled = true
        UIApplication.shared.keyWindow?.rootViewController = pageController
//        present(pageController, animated: true, completion: nil)
//        let vc = self.storyboard!.instantiateViewController(withIdentifier: "hideVC")
//        vc.heroModalAnimationType = .zoom
//        hero_replaceViewController(with: vc)
//        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func hideAction(_ sender: Any) {
        let vc = self.storyboard!.instantiateViewController(withIdentifier: "showVC")
        vc.heroModalAnimationType = .zoomOut
        hero_replaceViewController(with: vc)
//        heroModalAnimationType = .zoomOut
//        dismiss(animated: true, completion: nil)
    }
}

