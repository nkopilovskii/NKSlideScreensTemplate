# NKSlideScreensTemplate

<!-- [![CI Status](https://img.shields.io/travis/nkopilovskii/NKSlideScreensTemplate.svg?style=flat)](https://travis-ci.org/nkopilovskii/NKSlideScreensTemplate) -->
[![Version](https://img.shields.io/cocoapods/v/NKSlideScreensTemplate.svg?style=flat)](https://cocoapods.org/pods/NKSlideScreensTemplate)
[![License](https://img.shields.io/cocoapods/l/NKSlideScreensTemplate.svg?style=flat&color=yellow)](https://cocoapods.org/pods/NKSlideScreensTemplate)
[![Platform](https://img.shields.io/cocoapods/p/NKSlideScreensTemplate.svg?style=flat&color=black)](https://cocoapods.org/pods/NKSlideScreensTemplate)

## Description
The solution is a template with the implementation of the basic methods of configuration and  management of UIPageViewController.

The solution is designed for multi-level architectures, as it allows to distribute the code into the corresponding layers of the module.

## Example

1. Create `ViewController` class with parent `NKSlidesViewController` class

```swift
  class ViewController: NKSlidesViewController { }
```

2. Override properties `source: NKSlidesSource` and  `container: UIView` for the ability to configure slide pages
```swift 
  class ViewController: NKSlidesViewController {

    override var source: NKSlidesSource? { return ... }
    
    override var container: UIView { return ... }

  }
```

3. Create type custom supporting `NKSlidesSource` protocol (*if you use MVC you can implement protocol in ViewController class*)
```swift
  class Presenter: NKSlidesSource {

    var viewer: NKSlideScreenViewable?

    var initialPage: UIViewController {
      //return UIViewController instance which must to be shown first on screen's display
      return ...
    }
    
    func didPresent(_ page: UIViewController?) {
      //any action after page was presented
    }
    
    
    func page(after viewController: UIViewController) ->  UIViewController? {
      //return UIViewController instance which must to be shown after passed page 
      return ...
    }
    
    func page(before viewController: UIViewController) -> UIViewController? {
      //return UIViewController instance which must to be shown after passed page 
      return ...
    }
    
  }
```

4. Add `Presenter` initialization to `ViewController`
```swift 
class ViewController: NKSlidesViewController {

  override var source: NKSlidesSource? { 
    return presenter
    // if you use MVC you can `return self`
  }

  override var container: UIView { return ... }
  
  lazy var presenter = Presenter(self)

}
```

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

**iOS** 10.0

**Swift** 5.0

## Installation

NKSlideScreensTemplate is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NKSlideScreensTemplate'
```

## Author

nkopilovskii, nkopilovskii@gmail.com

## License

NKSlideScreensTemplate is available under the MIT license. See the LICENSE file for more info.
