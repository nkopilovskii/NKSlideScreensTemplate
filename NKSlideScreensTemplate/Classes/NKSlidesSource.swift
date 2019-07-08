//
//  NKSlidesSource.swift
//  NKSlideScreensTemplate
//
//  Created by Nick Kopilovskii on 7/6/19.
//

import UIKit

public protocol NKSlidesSource {
  var viewer: NKSlideScreenViewable? { get }
  
  var initialPage: UIViewController { get }
  
  func didPresent(_ page: UIViewController?)
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
