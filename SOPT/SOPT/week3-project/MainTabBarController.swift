//
//  MainTabBarController.swift
//  SOPT
//
//  Created by 김송희 on 11/8/24.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViewControllers()
        setStyle()

    }
    
    private func setViewControllers() {
        let todayViewController = TodayViewController()
        let gamesViewController = GamesViewController()
        let appsViewController = FinAppViewController()
        let arcadeViewController = ArcadeViewController()
        let searchViewController = SearchViewController()
        
        let todayNavController = UINavigationController(rootViewController: todayViewController)
        let gamesNavController = UINavigationController(rootViewController: gamesViewController)
        let appsNavController = UINavigationController(rootViewController: appsViewController)
        let arcadeNavController = UINavigationController(rootViewController: arcadeViewController)
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        
        todayNavController.tabBarItem = UITabBarItem(title: "투데이", image: UIImage(systemName: "doc.text"), tag: 0)
        gamesNavController.tabBarItem = UITabBarItem(title: "게임", image: UIImage(systemName: "gamecontroller"), tag: 1)
        appsNavController.tabBarItem = UITabBarItem(title: "앱", image: UIImage(systemName: "square.stack.3d.down.right.fill"), tag: 2)
        arcadeNavController.tabBarItem = UITabBarItem(title: "Arcade", image: UIImage(systemName: "gamecontroller.fill"), tag: 3)
        searchNavController.tabBarItem = UITabBarItem(title: "검색", image: UIImage(systemName: "magnifyingglass"), tag: 4)
        
        self.viewControllers = [todayNavController, gamesNavController, appsNavController, arcadeNavController, searchNavController]
    }
    
    private func setStyle() {
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .systemBlue
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.isTranslucent = false
    }
    
}

class TodayViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "투데이"
    }
}

class GamesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "게임"
    }
}

class ArcadeViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "Arcade"
    }
}

class SearchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.title = "검색"
    }
}

