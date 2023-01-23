//
//  TopControlView.swift
//  mjm
//
//  Created by 池上智啓 on 2022/11/21.
//

import UIKit
import RxCocoa
import RxSwift

class TopControlView: UIView {
    
    private let disposeBag = DisposeBag()
    
    let tinderbutton = createTopButton(imageName: "火の玉のアイコン素材", unselectedImage: "火の玉のアイコン素材 (1)")
    let goodbutton = createTopButton(imageName: "ダイヤのマーク", unselectedImage: "ダイヤのマーク (1)")
    let commentbutton = createTopButton(imageName: "コメントのアイコン素材 その4", unselectedImage: "コメントのアイコン素材 その4 (1)")
    let profilebutton = createTopButton(imageName: "人物アイコン", unselectedImage: "人物アイコン (1)")
    
    static private func createTopButton(imageName: String, unselectedImage: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .selected)
        button.setImage(UIImage(named: unselectedImage), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        setupBindings()
    }
    
    private func setupLayout() {
        let baseStackView = UIStackView(arrangedSubviews: [tinderbutton, goodbutton, commentbutton, profilebutton])
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 43
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(baseStackView)
        
        baseStackView.anchor(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, leftPadding: 40, rightPadding: 40)
        
//        [baseStackView.topAnchor.constraint(equalTo: topAnchor),
//         baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//         baseStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
//         baseStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),
//        ].forEach { $0.isActive = true }
        
        tinderbutton.isSelected = true
    }
    
    private func setupBindings() {
        
        tinderbutton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.tinderbutton)
            })
            .disposed(by: disposeBag)
        
        goodbutton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.goodbutton)
            })
            .disposed(by: disposeBag)
        
        commentbutton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.commentbutton)
            })
            .disposed(by: disposeBag)
        
        profilebutton.rx.tap
            .asDriver()
            .drive(onNext: { [weak self] _ in
                guard let self = self else { return }
                self.handleSelectedButton(selectedButton: self.profilebutton)
            })
            .disposed(by: disposeBag)
    }
    
    private func handleSelectedButton(selectedButton: UIButton) {
        let buttons = [tinderbutton, goodbutton, commentbutton, profilebutton]
        
        buttons.forEach { button in
            if button == selectedButton {
                button.isSelected = true
            } else {
                button.isSelected = false
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
