//
//  ViewController.swift
//  NKSlideScreensTemplate
//
//  Created by nkopilovskii on 07/06/2019.
//  Copyright (c) 2019 nkopilovskii. All rights reserved.
//

import UIKit
import NKSlideScreensTemplate

//MARK: - ViewController
class ViewController: NKSlidesViewController {
  
  @IBOutlet weak var lblSelectedPage: UILabel!
  
  override var source: NKSlidesSource? { return somePresenter }
  
  override var container: UIView { return view.viewWithTag(1) ?? view }
  
  private lazy var somePresenter = Presenter(self)
}

//MARK: - Presenter
class Presenter: NKSlidesSource {
  
  var viewer: NKSlideScreenViewable?
  
  var initialPage: UIViewController {
    let initial = pages.first ?? UIViewController()
    didPresent(initial)
    return initial
  }
  
  lazy var pages: [UIViewController] = {
    let vc1 = UIViewController()
    vc1.view.backgroundColor = .red
    vc1.title = "First page"
    
    let vc2 = UIViewController()
    vc2.view.backgroundColor = .yellow
    vc2.title = "Second page"
    
    let vc3 = UIViewController()
    vc3.view.backgroundColor = .green
    vc3.title = "Third page"
    
    let vc4 = UIViewController()
    vc4.view.backgroundColor = .blue
    vc4.title = "Fourth page"
    
    let vc5 = UIViewController()
    vc5.view.backgroundColor = .black
    vc5.title = "Fifth page"
    
    return [vc1, vc2, vc3, vc4, vc5]
  }()
  
  init(_ viewer: NKSlideScreenViewable) {
    self.viewer = viewer
  }
  
  func didPresent(_ page: UIViewController?) {
    //some action
    (viewer as? ViewController)?.lblSelectedPage.text = page?.title
  }
  
  func page(after viewController: UIViewController) -> UIViewController? {
    guard let index = pages.firstIndex(of: viewController),
      index < pages.count - 1 else {
      return nil
    }
    
    return pages[index + 1]
  }
  
  func page(before viewController: UIViewController) -> UIViewController? {
    guard let index = pages.firstIndex(of: viewController),
      index > 0 else {
        return nil
    }
    return pages[index - 1]
  }
  
  
}
