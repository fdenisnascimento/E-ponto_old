// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation
import UIKit

// swiftlint:disable file_length
// swiftlint:disable line_length
// swiftlint:disable type_body_length

protocol StoryboardSceneType {
  static var storyboardName: String { get }
}

extension StoryboardSceneType {
  static func storyboard() -> UIStoryboard {
    return UIStoryboard(name: self.storyboardName, bundle: Bundle(for: BundleToken.self))
  }

  static func initialViewController() -> UIViewController {
    guard let vc = storyboard().instantiateInitialViewController() else {
      fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
    }
    return vc
  }
}

extension StoryboardSceneType where Self: RawRepresentable, Self.RawValue == String {
  func viewController() -> UIViewController {
    return Self.storyboard().instantiateViewController(withIdentifier: self.rawValue)
  }
  static func viewController(identifier: Self) -> UIViewController {
    return identifier.viewController()
  }
}

protocol StoryboardSegueType: RawRepresentable { }

extension UIViewController {
  func perform<S: StoryboardSegueType>(segue: S, sender: Any? = nil) where S.RawValue == String {
    performSegue(withIdentifier: segue.rawValue, sender: sender)
  }
}

enum StoryboardScene {
  enum LaunchScreen: StoryboardSceneType {
    static let storyboardName = "LaunchScreen"
  }
  enum Main: String, StoryboardSceneType {
    static let storyboardName = "Main"

    static func initialViewController() -> E_ponto.LoginViewController {
      guard let vc = storyboard().instantiateInitialViewController() as? E_ponto.LoginViewController else {
        fatalError("Failed to instantiate initialViewController for \(self.storyboardName)")
      }
      return vc
    }

    case loginControllerScene = "loginController"
    static func instantiateLoginController() -> E_ponto.LoginViewController {
      guard let vc = StoryboardScene.Main.loginControllerScene.viewController() as? E_ponto.LoginViewController
      else {
        fatalError("ViewController 'loginController' is not of the expected class E_ponto.LoginViewController.")
      }
      return vc
    }

    case mainControllerScene = "mainController"
    static func instantiateMainController() -> E_ponto.MainViewController {
      guard let vc = StoryboardScene.Main.mainControllerScene.viewController() as? E_ponto.MainViewController
      else {
        fatalError("ViewController 'mainController' is not of the expected class E_ponto.MainViewController.")
      }
      return vc
    }

    case navControllerScene = "navController"
    static func instantiateNavController() -> UINavigationController {
      guard let vc = StoryboardScene.Main.navControllerScene.viewController() as? UINavigationController
      else {
        fatalError("ViewController 'navController' is not of the expected class UINavigationController.")
      }
      return vc
    }
  }
}

enum StoryboardSegue {
}

private final class BundleToken {}
