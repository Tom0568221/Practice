//
//  ViewController.swift
//  mjm
//
//  Created by 池上智啓 on 2022/11/21.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let topcontrolView = TopControlView()
        let cardView = CardView()
        let bottomControlView = BottomControlView()
      
        let stackview = UIStackView(arrangedSubviews: [topcontrolView, cardView, bottomControlView])
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        
        self.view.addSubview(stackview)
        
        [
            topcontrolView.heightAnchor.constraint(equalToConstant: 100),
            bottomControlView.heightAnchor.constraint(equalToConstant: 100),
            
            stackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackview.leftAnchor.constraint(equalTo: view.leftAnchor),
            stackview.rightAnchor.constraint(equalTo: view.rightAnchor)]
            .forEach { $0.isActive = true }
    
        // Do any additional setup after loading the view.
    }


}

