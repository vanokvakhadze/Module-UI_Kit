//
//  LoginPageView.swift
//  DataPersistance.mvvm
//
//  Created by vano Kvakhadze on 26.04.24.
//

import UIKit

protocol LoginPageDelegate: AnyObject {
    func tapTonextpage()
}
class LoginPageView: UIView {
    
    let safeZones: UIView
    
    var imagePage: UIImageView
    
    let userName: UILabel
    let userInput: UITextField
     
    let firstPassword: UILabel
    let firstInput: UITextField
    
    let secondPassword: UILabel
    let secondInput: UITextField
    
    let nextButton: UIButton
    
    
    override init(frame: CGRect) {
        safeZones = UIView()
        imagePage =  UIImageView()
        userName = UILabel.customLabel()
        userInput = UITextField.customInput()
        firstPassword = UILabel.customLabel()
        firstInput = UITextField.customInput()
        secondPassword = UILabel.customLabel()
        secondInput = UITextField.customInput()
        
        nextButton = UIButton()
        
        super.init(frame: frame)
        
        addSafeZone()
        addImage()
        adddetails()
        addLoginButton()
    }
    
    
    //MARK: delegate init
    
    weak var delegate: LoginPageDelegate?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addSafeZone(){
        self.addSubview(safeZones)
        let area = self.safeAreaLayoutGuide
        safeZones.topAnchor.constraint(equalTo: area.topAnchor).isActive = true
        safeZones.leadingAnchor.constraint(equalTo: area.leadingAnchor).isActive = true
        safeZones.trailingAnchor.constraint(equalTo: area.trailingAnchor).isActive = true
        safeZones.bottomAnchor.constraint(equalTo: area.bottomAnchor).isActive = true
        safeZones.translatesAutoresizingMaskIntoConstraints = false
        safeZones.backgroundColor = .systemBackground
       
    }
    //MARK: ADD IMAGE
    func addImage(){
        safeZones.addSubview(imagePage)
        imagePage.image = UIImage(named: "addimage")
        imagePage.layer.cornerRadius = 25
        imagePage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imagePage.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor),
            imagePage.widthAnchor.constraint(equalToConstant: 132),
            imagePage.heightAnchor.constraint(equalToConstant: 132),
            imagePage.topAnchor.constraint(equalTo: safeZones.topAnchor, constant: 90)
        ])
    }
    
    
    //MARK: add details
    func adddetails(){
        safeZones.addSubview(userName)
        safeZones.addSubview(userInput)
        safeZones.addSubview(firstPassword)
        safeZones.addSubview(firstInput)
        safeZones.addSubview(secondPassword)
        safeZones.addSubview(secondInput)
        userName.text = "მომხმარებლის სახელი"
        firstPassword.text = "პაროლი"
        secondPassword.text = "განმეორებითი პაროლი"
        
        userInput.placeholder = "  შეიყვანეთ მომხარებლის სახელი"
        firstInput.placeholder = "  შეიყვანეთ პაროლი"
        secondInput.placeholder = "  განმეორებით შეიყვანეთ პაროლი"
        //MARK: layout config
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: safeZones.topAnchor, constant: 270),
            userName.leadingAnchor.constraint(equalTo: safeZones.leadingAnchor, constant: 24),
            userInput.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 6),
            userInput.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor),
            
            firstPassword.topAnchor.constraint(equalTo: userInput.bottomAnchor, constant: 31),
            firstPassword.leadingAnchor.constraint(equalTo: safeZones.leadingAnchor, constant: 24),
            firstInput.topAnchor.constraint(equalTo: firstPassword.bottomAnchor, constant: 6),
            firstInput.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor),
            
            secondPassword.topAnchor.constraint(equalTo: firstInput.bottomAnchor, constant: 31),
            secondPassword.leadingAnchor.constraint(equalTo: safeZones.leadingAnchor, constant: 24),
            secondInput.topAnchor.constraint(equalTo: secondPassword.bottomAnchor, constant: 6),
            secondInput.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor),
            
        ])
    }
    //MARK: ADD button
    func addLoginButton(){
        safeZones.addSubview(nextButton)
        nextButton.topAnchor.constraint(equalTo: secondInput.bottomAnchor, constant: 50).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 327).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        nextButton.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor).isActive = true
        nextButton.layer.cornerRadius = 22.5
        nextButton.setTitle("შესვლა", for: .normal)
        nextButton.backgroundColor = .systemBlue
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        //nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        nextButton.addAction(UIAction { _ in
            self.nextPage()}, for: .touchUpInside)
    }
    
    func nextPage(){
        delegate?.tapTonextpage()
    }
    
}

//MARK: set up controller
class LoginPageController: UIViewController, LoginPageDelegate {
  
    var itemView: LoginPageView
    var itemModel: LoginPageViewModel
    
    init() {
        self.itemView = LoginPageView()
        self.itemModel = LoginPageViewModel()
        super.init(nibName: nil, bundle: nil)
        itemView.delegate = self
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = itemView
        view.backgroundColor = .systemBackground
        addLibraryImage()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // view.backgroundColor = .systemBackground
        addLibraryImage()
        
    }
    //MARK: --
    func loggedUser(){
        itemModel.viewUpdate(user: itemView.userInput.text ?? "", password: itemView.firstInput.text ?? "" , repassword: itemView.secondInput.text ?? "" )
    }
    
    func tapTonextpage() {
        loggedUser()
        let MainVC  = MainPageViewController()
        navigationController?.pushViewController(MainVC, animated: true)
    }
    
    //MARK: alerti
    func sendAlert(message: String, title: String) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "", style: .default))
           self.present(alert, animated: true, completion: nil)
       }
   
    
    func addLibraryImage(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        itemView.imagePage.isUserInteractionEnabled = true
        itemView.imagePage.addGestureRecognizer(tap)
    }
    
    //MARK: libreridan fotos wamosagebi mara vergar avamushave
    @objc func  imageTapped(){
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType =  .photoLibrary
        imagePicker.delegate = self
        self.present(imagePicker, animated: true)
    }
    
    
    
}
//MARK: ფოტოების ექსთენშენში
extension LoginPageController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        LoginPageView().imagePage.image = info[.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }

    
}
