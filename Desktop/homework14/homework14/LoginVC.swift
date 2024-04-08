//
//  ViewController.swift
//  homework14
//
//  Created by vano Kvakhadze on 07.04.24.
//

import UIKit


class LoginVC: UIViewController {

    let mainView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()
    let label: UILabel = {
        let label = UILabel()
        label.text = "ავტორიზაცია"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let stackOfIntruduction: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let stackOfLogin: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let logginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "secondColor")
        button.layer.cornerRadius = 12
        button.setTitle("შესვლა", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
     
    let stackOfSpace: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let socialMediaStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        safeAreaView()
        addImage()
        stackOfintru()
        addIntoStackOfIntu()
        Authorization()
        addLine()
        loginStack()
        addToLoginStack()
        addButton()
        stackSpace()
        addSpace()
        makeSocialStack()
        addSocialMedia()
    }
    
    func safeAreaView(){
        self.view.addSubview(mainView)
        let safeArea = view.safeAreaLayoutGuide
        mainView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20).isActive = true
        mainView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20).isActive = true
    }
    
    func addImage(){
        
        let image = UIImage(named: "Image")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 142).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -143).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    func stackOfintru(){
        mainView.addSubview(stackOfIntruduction)
        stackOfIntruduction.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 70).isActive = true
        stackOfIntruduction.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        stackOfIntruduction.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        stackOfIntruduction.heightAnchor.constraint(equalToConstant: 126).isActive = true
    }
    
    func addIntoStackOfIntu(){
        let label = UILabel()
        label.text = "მოგესალმებით!"
        label.font = .systemFont(ofSize: 24)
        let txt = UITextView()
        txt.text = "ამ აპლიკაციის გამოყენების საუკეთესო გზა თქვენს ანგარიშზე შესვლაა, თუ არ გაქვთ ანგარიში გააკეთეთ, თუ არ გსურთ გაკეთება დასტოვეთ აქაურობა და წაშალეთ აპლიკაცია."
        txt.font = .systemFont(ofSize: 14)
        txt.textColor = .darkGray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        txt.translatesAutoresizingMaskIntoConstraints = false
        stackOfIntruduction.addArrangedSubview(label)
        stackOfIntruduction.addArrangedSubview(txt)
    }
    
    
    func Authorization(){
        mainView.addSubview(label)
        label.topAnchor.constraint(equalTo: stackOfIntruduction.bottomAnchor, constant: 20).isActive = true
        label.leadingAnchor.constraint(equalTo: stackOfIntruduction.leadingAnchor, constant: 120.5).isActive = true
        label.widthAnchor.constraint(equalToConstant: 95).isActive = true
        label.heightAnchor.constraint(equalToConstant: 20).isActive = true
        label.font = .systemFont(ofSize: 14)
    }
    
    func addLine(){
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        mainView.addSubview(line)
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.topAnchor.constraint(equalTo: stackOfIntruduction.bottomAnchor , constant: 60).isActive = true
        line.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 4.5).isActive = true
        line.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -4.5).isActive = true
        line.backgroundColor =   UIColor(named: "secondColor")
    }
    
    func loginStack(){
        mainView.addSubview(stackOfLogin)
        stackOfLogin.topAnchor.constraint(equalTo: stackOfIntruduction.bottomAnchor, constant: 84).isActive = true
        stackOfLogin.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        stackOfLogin.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        stackOfLogin.heightAnchor.constraint(equalToConstant: 220).isActive = true
    }
    
    func addToLoginStack(){
        let name = UILabel()
        name.text = "სრული სახელი"
        name.translatesAutoresizingMaskIntoConstraints = false
        
        let mail = UILabel()
        mail.text = "ელ.ფოსტა"
        mail.translatesAutoresizingMaskIntoConstraints = false
        
        let password = UILabel()
        password.text = "პაროლი"
        password.translatesAutoresizingMaskIntoConstraints = false
        
        let inputOfname = UITextField()
        inputOfname.placeholder = "მაგ: ქეთინო ფერი"
        inputOfname.translatesAutoresizingMaskIntoConstraints = false
        
        let inputOfmail = UITextField()
        inputOfmail.placeholder  = "მაგ: kusuna@gmail.com"
        inputOfmail.translatesAutoresizingMaskIntoConstraints = false
        
        let inputOfpassword = UITextField()
        inputOfpassword.placeholder = "მაგ:busuna123, jajanaISMyKumir2010"
        inputOfpassword.translatesAutoresizingMaskIntoConstraints = false
        
        inputOfname.heightAnchor.constraint(equalToConstant: 44).isActive = true
        inputOfmail.heightAnchor.constraint(equalToConstant: 44).isActive = true
        inputOfpassword.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        inputOfname.borderStyle = .roundedRect
        inputOfmail.borderStyle = .roundedRect
        inputOfpassword.borderStyle = .roundedRect
         
        stackOfLogin.spacing = 5
        stackOfLogin.addArrangedSubview(name)
        stackOfLogin.addArrangedSubview(inputOfname)
        stackOfLogin.addArrangedSubview(mail)
        stackOfLogin.addArrangedSubview(inputOfmail)
        stackOfLogin.addArrangedSubview(password)
        stackOfLogin.addArrangedSubview(inputOfpassword)
    }
    
    func addButton(){
        mainView.addSubview(logginButton)
        logginButton.topAnchor.constraint(equalTo: stackOfLogin.bottomAnchor, constant: 16).isActive = true
        logginButton.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        logginButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        logginButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
    }
    func stackSpace(){
        mainView.addSubview(stackOfSpace)
        stackOfSpace.topAnchor.constraint(equalTo: logginButton.bottomAnchor, constant: 24).isActive = true
        stackOfSpace.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        stackOfSpace.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        stackOfSpace.heightAnchor.constraint(equalToConstant: 22).isActive = true
    }
    
    func addSpace(){
        let line1 = UIView()
        stackOfSpace.addArrangedSubview(line1)
        line1.topAnchor.constraint(equalTo: stackOfSpace.topAnchor, constant: 11).isActive = true
        line1.widthAnchor.constraint(equalToConstant: 146).isActive = true
        line1.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line1.translatesAutoresizingMaskIntoConstraints = false
        
        let horizon = UIView()
        line1.addSubview(horizon)
        horizon.topAnchor.constraint(equalTo: line1.topAnchor, constant: 6).isActive = true
        horizon.widthAnchor.constraint(equalToConstant: 146).isActive = true
        horizon.heightAnchor.constraint(equalToConstant: 1).isActive = true
        horizon.backgroundColor = .gray
        horizon.translatesAutoresizingMaskIntoConstraints = false
        
        
        let or = UILabel()
        or.text = "ან"
        or.translatesAutoresizingMaskIntoConstraints = false
        or.font = .systemFont(ofSize: 14)
        stackOfSpace.addArrangedSubview(or)
        
        let line2 = UIView()
        line2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        stackOfSpace.addArrangedSubview(line2)
        line2.topAnchor.constraint(equalTo: stackOfSpace.topAnchor, constant: 11).isActive = true
        line2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line2.widthAnchor.constraint(equalToConstant: 146).isActive = true
        line2.translatesAutoresizingMaskIntoConstraints = false
        
        let inLine2 = UIView()
        line2.addSubview(inLine2)
        inLine2.topAnchor.constraint(equalTo: line2.topAnchor, constant: 6).isActive = true
        inLine2.widthAnchor.constraint(equalToConstant: 144).isActive = true
        inLine2.heightAnchor.constraint(equalToConstant: 1).isActive = true
        inLine2.backgroundColor = .gray
        inLine2.translatesAutoresizingMaskIntoConstraints = false
        
        
        stackOfSpace.distribution = .equalSpacing
    }
    
    func makeSocialStack(){
        mainView.addSubview(socialMediaStack)
        socialMediaStack.topAnchor.constraint(equalTo: stackOfSpace.bottomAnchor, constant: 24).isActive = true
        socialMediaStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
        socialMediaStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        socialMediaStack.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
    }
    
    func addSocialMedia(){
        
        let button1 = UIButton()
        button1.setTitle("   გამოიყენეთ ფეისბურქი", for: .normal)
        button1.setTitleColor(.black, for: .normal)
        button1.widthAnchor.constraint(equalToConstant: 335).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.layer.cornerRadius = 12
        button1.backgroundColor = UIColor(named: "buttonColor")
        let imageOfF = UIImage(named: "facebook")
        button1.setImage(imageOfF, for: .normal)
        button1.titleLabel?.font = .systemFont(ofSize: 14)
        button1.titleLabel?.textColor = .black
        
        let button2 = UIButton()
        button2.setTitleColor(.black, for: .normal)
        button2.setTitle("   გამოიყენეთ გულუგულუ", for: .normal)
        button2.widthAnchor.constraint(equalToConstant: 335).isActive = true
        button2.translatesAutoresizingMaskIntoConstraints = false
        button1.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button2.layer.cornerRadius = 12
        button2.backgroundColor = UIColor(named: "buttonColor")
        let imageOfG = UIImage(named: "google")
        button2.setImage(imageOfG, for: .normal)
        button2.titleLabel?.font = .systemFont(ofSize: 14)
    
        
        
        socialMediaStack.spacing = 16
        socialMediaStack.distribution = .fillEqually
        socialMediaStack.addArrangedSubview(button1)
        socialMediaStack.addArrangedSubview(button2)
    }
    
    

}
#Preview {
    LoginVC()
}
