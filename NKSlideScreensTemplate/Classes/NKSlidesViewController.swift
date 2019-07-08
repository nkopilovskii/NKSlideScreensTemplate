//
//  NKSlidesViewController.swift
//  NKSlideScreensTemplate
//
//  Created by Nick Kopilovskii on 7/6/19.
//

import UIKit

public protocol NKSlideScreenDisplay where Self : UIViewController {
  var container: UIView { get }
  var pageViewController: UIPageViewController { get set }
  func configuratePageViewController()
}

open class NKSlidesViewController: UIViewController, NKSlideScreenDisplay, UIPageViewControllerDelegate, UIPageViewControllerDataSource  {
  
  open var container: UIView { return view }
  open var pageViewController: UIPageViewController = UIPageViewController()
  
  open var source: NKSlidesSource? { return nil }
 
  open var contentPageViewController: UIPageViewController?
  
  
  override open func viewDidLoad() {
    super.viewDidLoad()
    configuratePageViewController()
  }
  
  open func configuratePageViewController() {
    guard let source = source else { return }
    pageViewController = UIPageViewController(transitionStyle: source.transitionStyle, navigationOrientation: source.navigationOrientation, options: nil)
    pageViewController.setViewControllers([source.initialPage], direction: .forward, animated: false)
    pageViewController.delegate = self
    pageViewController.dataSource = self
    
    addChild(pageViewController)
    container.addSubview(pageViewController.view)
    pageViewController.didMove(toParent: self)
    
    pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
    pageViewController.view.topAnchor.constraint(equalTo: container.topAnchor, constant: 0).isActive = true
    pageViewController.view.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
    pageViewController.view.leftAnchor.constraint(equalTo: container.leftAnchor, constant: 0).isActive = true
    pageViewController.view.rightAnchor.constraint(equalTo: container.rightAnchor, constant: 0).isActive = true
  }
  
  open func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    return source?.page(before: viewController)
  }
  
  open func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    return source?.page(after: viewController)
  }
  
  open func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    guard completed else { return }
    source?.didPresent(pageViewController.viewControllers?.first)
  }

}
