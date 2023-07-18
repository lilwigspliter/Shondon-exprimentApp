//
//  CountdownViewController.swift
//  Shondon
//
//  Created by Rashon Hyslop on 7/17/23.
//

import SwiftUI

class CountdownViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let countdownView = CountdownView()
        let hostingController = UIHostingController(rootView: countdownView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        hostingController.didMove(toParent: self)
    }
}
