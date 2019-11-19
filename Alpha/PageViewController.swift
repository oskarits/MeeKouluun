//
//  PageViewController.swift
//  Alpha
//
//  Created by iosdev on 19/11/2019.
//  Copyright © 2019 Jari Pietikäinen. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    lazy var viewControllerList: [UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc01 = sb.instantiateViewController(withIdentifier: "Questions1")
        let vc02 = sb.instantiateViewController(withIdentifier: "Questions2")
        let vc03 = sb.instantiateViewController(withIdentifier: "Questions3")
        let vc04 = sb.instantiateViewController(withIdentifier: "Questions4")
        let vc05 = sb.instantiateViewController(withIdentifier: "Questions5")
        let vc06 = sb.instantiateViewController(withIdentifier: "Questions6")
        let vc07 = sb.instantiateViewController(withIdentifier: "Questions7")
        let vc08 = sb.instantiateViewController(withIdentifier: "Questions8")
        let vc09 = sb.instantiateViewController(withIdentifier: "Questions9")
        let vc10 = sb.instantiateViewController(withIdentifier: "Questions10")
        
        return [vc01, vc02, vc03, vc04, vc05, vc06, vc07, vc08, vc09, vc10]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
        if let firstViewController = viewControllerList.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    
 
    
    
    
    
    
    
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for view in self.view.subviews {
            if view is UIScrollView {
                view.frame = UIScreen.main.bounds
            } else if view is UIPageControl {
                view.backgroundColor = UIColor.clear
            }
        }
    }
    
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = viewControllerList.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
            //return viewControllerList.last
        }
        
        guard viewControllerList.count > previousIndex else {
            return nil
        }
        
        return viewControllerList[previousIndex]
    }
    
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = viewControllerList.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex < viewControllerList.count else {
            return nil
            //return viewControllerList.first
        }
        
        guard viewControllerList.count > nextIndex else {
            return nil
        }
        
        return viewControllerList[nextIndex]
    }
    
    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return viewControllerList.count
    }
    
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = viewControllerList.index(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
}

