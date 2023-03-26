//
//  ChangeNameAlert.swift
//  UserListGitHub
//
//  Created by 江柏毅 on 2023/3/27.
//

import UIKit

protocol TextFieldAlertDelegate {
    func returnTextFieldAlertValue(_ textFieldAlert: ChangeNameAlert, isConfirm:Bool, text:String)
}

class ChangeNameAlert: UIView {
    var textFieldMessage : String?
    var delegate : TextFieldAlertDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
       commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        
    }
    
    private func clickRight(_ sender: Any) {
        textFieldMessage = self.textField.text
        self.delegate?.returnTextFieldAlertValue(self, isConfirm: true, text: textFieldMessage ?? "空的")
    }
    
    private func addUI() {
        [titleLabel, textField, leftButton, rightButton].forEach { (view) in
            alertView.addSubview(view)
        }
        scrollView.addSubview(alertView)
        addSubview(scrollView)
    }

    private func addConstraints() {
        
    }
    
    private var alertView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        return view
    }()

    private var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.text = "Edit your name"
        return label
    }()
    
    private var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Please enter a name"
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        return textField
    }()
    
    private var leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.setTitleColor(UIColor(hexString: "#a6a6a6"), for: .normal)
        button.backgroundColor = UIColor(hexString: "#d4d4d4")
        button.layer.masksToBounds = true // 設置按鈕圓角是否生效
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private var rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(UIColor(hexString: "#ffffff"), for: .normal)
        button.backgroundColor = UIColor(hexString: "#147edb")
        button.layer.masksToBounds = true // 設置按鈕圓角是否生效
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.isPagingEnabled = false
        return scrollView
    }()
}
