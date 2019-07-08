//
//  NKSlideScreenViewable.swift
//  NKSlideScreensTemplate
//
//  Created by Nick Kopilovskii on 7/6/19.
//

import UIKit

public protocol NKSlideScreenViewable {
  
  var source: NKSlidesSource? { get }
  
  var contentPageViewController: UIPageViewController? { get }
  
//  var selectedPageIndex: Int { get }
  
  var currentPage: UIViewController? { get }
  
  func setPageTitles(_ titles: [String])
  
  
  
  func present(_ page: UIViewController, with direction: UIPageViewController.NavigationDirection)
}


public extension NKSlideScreenViewable {
//  var selectedPageIndex: Int {
//    get {
//      return 0
//    }
//  }
  
  var currentPage: UIViewController? {
    return contentPageViewController?.viewControllers?.first
  }

  
  func present(_ page: UIViewController, with direction: UIPageViewController.NavigationDirection) {
    
  }
}
