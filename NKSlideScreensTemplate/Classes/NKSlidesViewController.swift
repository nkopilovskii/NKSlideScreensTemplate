//
//  NKSlidesViewController.swift
//  NKSlideScreensTemplate
//
//  Created by Nick Kopilovskii on 7/6/19.
//

import UIKit


open class NKSlidesViewController: UIViewController, NKSlideScreenDisplay, NKSlideScreenViewable, UIPageViewControllerDelegate, UIPageViewControllerDataSource  {
  
  //MARK: NKSlideScreenViewable properties implementation
  open var source: NKSlidesSource? { return nil }
 
  open var contentPageViewController: UIPageViewController {
    return pageViewController
  }
  
  //MARK: NKSlideScreenDisplay properties implementation
  open var container: UIView { return view }
  
  public var pageViewController: UIPageViewController = UIPageViewController()
  
  open var transitionStyle: UIPageViewController.TransitionStyle {
    return .scroll
  }
  
  open var navigationOrientation: UIPageViewController.NavigationOrientation {
    return .horizontal
  }
  
  //MARK: Base method implementation
  override open func viewDidLoad() {
    super.viewDidLoad()
    configuratePageViewController()
  }
  
  //MARK: NKSlideScreenDisplay method implementation
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
  
  //MARK: UIPageViewControllerDelegate, UIPageViewControllerDataSource implementation
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
