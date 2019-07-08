//
//  NKSlidesSource.swift
//  NKSlideScreensTemplate
//
//  Created by Nick Kopilovskii on 7/6/19.
//

import UIKit

public protocol NKSlidesSource {
  var viewer: NKSlideScreenViewable? { get }
  
  var transitionStyle: UIPageViewController.TransitionStyle { get }
  var navigationOrientation: UIPageViewController.NavigationOrientation { get }
  var spineLocation: UIPageViewController.SpineLocation { get }
  
  var initialPage: UIViewController { get }
  
  var pageTitleList: [String]? { get }
  
  func didSelectPage(at index: Int)
  func didPresent(_ page: UIViewController?)
  func page(at index: Int) -> UIViewController?
  func page(after viewController: UIViewController) -> UIViewController?
  func page(before viewController: UIViewController) -> UIViewController?

}


public extension NKSlidesSource {
  
  var transitionStyle: UIPageViewController.TransitionStyle {
    return .scroll
  }
  
  var navigationOrientation: UIPageViewController.NavigationOrientation {
    return .horizontal
  }
  
  var spineLocation: UIPageViewController.SpineLocation {
    return .none
  }
  
  
}
