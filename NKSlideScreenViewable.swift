//
//  NKSlideScreenViewable.swift
//  NKSlideScreensTemplate
//
//  Created by Nick Kopilovskii on 7/6/19.
//

import UIKit

public protocol NKSlideScreenViewable: class {
  
  var source: NKSlidesSource? { get }
  
  var contentPageViewController: UIPageViewController? { get }
  
  var currentPage: UIViewController? { get }
  
  func present(_ page: UIViewController, with direction: UIPageViewController.NavigationDirection)
  
}


public extension NKSlideScreenViewable {
  
  var currentPage: UIViewController? {
    return contentPageViewController?.viewControllers?.first
  }

  func present(_ page: UIViewController, with direction: UIPageViewController.NavigationDirection) {
    contentPageViewController?.setViewControllers([page], direction: direction, animated: true, completion: { [weak self] _ in
      self?.source?.didPresent(page)
    })
  }
  
}
