//
//  BottomControlView.swift
//  mjm
//
//  Created by 池上智啓 on 2022/11/21.
//

import UIKit

class BottomControlView: UIView {
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("tap", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        
        button.layer.shadowOffset = .init(width: 1.5, height: 2)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowRadius = 15
        return button
    }()
    
    let Uターン矢印2view = BottomButtonView(frame: .zero, width: 50, imageName: "Uターン矢印 2")
    let バツアイコンview = BottomButtonView(frame: .zero, width: 60, imageName: "細いバツのアイコン")
    let 星view = BottomButtonView(frame: .zero, width: 50, imageName: "星アイコン6")
    let ハートview = BottomButtonView(frame: .zero, width: 60, imageName: "ハートのマーク")
    let 電気view = BottomButtonView(frame: .zero, width: 50, imageName: "電気のアイコンその2")
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        let baseStackView = UIStackView(arrangedSubviews: [Uターン矢印2view, バツアイコンview, 星view, ハートview, 電気view])
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 10
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(baseStackView)
        
        [baseStackView.topAnchor.constraint(equalTo: topAnchor),
         baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
         baseStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
         baseStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),
        ].forEach { $0.isActive = true }

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class BottomButtonView: UIView {
        
        var button: BottomButton?
        
        init(frame: CGRect, width: CGFloat, imageName: String) {
            super.init(frame: frame)
            
            button = BottomButton(type: .custom)
            button?.setImage(UIImage(named: imageName)?.resize(size: .init(width: width * 0.4, height: width * 0.4)), for: .normal)
            button?.translatesAutoresizingMaskIntoConstraints = false
            button?.backgroundColor = .white
            button?.layer.cornerRadius = width / 2
            
            button?.layer.shadowOffset = .init(width: 1.5, height: 2)
            button?.layer.shadowColor = UIColor.black.cgColor
            button?.layer.shadowOpacity = 0.3
            button?.layer.shadowRadius = 15
            
            addSubview(button!)
            
            button?.anchor(centerY: centerYAnchor, centerX: centerXAnchor, width: width, height: width)
//            [button?.centerYAnchor.constraint(equalTo: centerYAnchor),
//            button?.centerXAnchor.constraint(equalTo: centerXAnchor),
//            button?.widthAnchor.constraint(equalToConstant: width),
//             button?.heightAnchor.constraint(equalToConstant: width)].forEach { $0?.isActive = true }
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
}

    class BottomButton: UIButton {
        
        override var isHighlighted: Bool {
            didSet {
                if isHighlighted {
                    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                        
                        self.transform = .init(scaleX: 0.8, y: 0.8)
                        self.layoutIfNeeded()
                        
                    }
                } else {
                    UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                        
                        self.transform = .identity
                        self.layoutIfNeeded()
                }
            }
        }
    }
        override init(frame: CGRect) {
            super.init(frame: frame)
                }
                
                required init?(coder: NSCoder) {
                    fatalError("init(coder:) has not been implemented")
                }
    }
}
