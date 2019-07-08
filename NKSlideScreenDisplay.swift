//
//  NKSlideScreenDisplay.swift
//  NKSlideScreensTemplate
//
//  Created by Nick Kopilovskii on 7/8/19.
//

import UIKit

public protocol NKSlideScreenDisplay where Self : UIViewController {
  
  var container: UIView { get }
  
  var pageViewController: UIPageViewController { get set }
  
  var transitionStyle: UIPageViewController.TransitionStyle { get }
  
  var navigationOrientation: UIPageViewController.NavigationOrientation { get }
  
  func configuratePageViewController()
  
}
