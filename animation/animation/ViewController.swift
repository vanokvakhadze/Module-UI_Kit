//
//  ViewController.swift
//  animation
//
//  Created by vano Kvakhadze on 10.05.24.
//

import UIKit

class ViewController: UIViewController {
    
    var isPlaying: Bool  = true
    
    var timer: Timer?
    var progress: Float = 0.0
    
    let spiningCircle = SpinnignView()
    
    let image = UIImageView()
    var topconstrait: NSLayoutConstraint?
    var widthconstrait:  NSLayoutConstraint?
    var heightconstrait:  NSLayoutConstraint?
    
    let musicDescription: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 7
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let progressBar: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.trackTintColor = .gray
        progress.progressTintColor = .systemBlue
        
        return progress
    }()
    
    let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalCentering

        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let shuffle =  UIImageView.customPhoto()
    let left = UIImageView.customPhoto()
    let right = UIImageView.customPhoto()
    let repeatImg = UIImageView.customPhoto()
    //
    let home = UIImageView()
    let music = UIImageView()
    let heart = UIImageView()
    
    let pauseBtn: UIButton  = {
        let btn = UIButton()
        btn.layer.cornerRadius = 0.5 * btn.bounds.size.width
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    let bottonView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 40
        return view
    }()
    
    let bottomSymbolStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 26
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        addimage()
        addStack()
        spinConfig()
        addprogressVIew()
        addButtonStack()
        addbottomVIew()
    }
    //MARK: addImage
    func addimage(){
        view.addSubview(image)
        image.layer.cornerRadius = 20
        image.image = UIImage(named: "Taylor")
        image.backgroundColor = .gray
        image.translatesAutoresizingMaskIntoConstraints = false
        topconstrait = image.topAnchor.constraint(equalTo: view.topAnchor, constant: 110)
        topconstrait?.isActive = true
        widthconstrait = image.widthAnchor.constraint(equalToConstant: 304)
        widthconstrait?.isActive = true
        heightconstrait = image.heightAnchor.constraint(equalToConstant: 319)
        heightconstrait?.isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
  
    
    
    //MARK: add spining
    func spinConfig(){
        view.addSubview(spiningCircle)
       spiningCircle.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        topconstrait?.isActive = true
        widthconstrait?.isActive = true
        heightconstrait?.isActive = true
    }
    
    func addSpinConstraits(){
        topconstrait = spiningCircle.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 15)
        widthconstrait = spiningCircle.widthAnchor.constraint(equalToConstant: 56)
        heightconstrait = spiningCircle.heightAnchor.constraint(equalToConstant: 56)
      
    }
    
    func showSpin(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            self.addSpinConstraits()
            UIView.animate(withDuration: 1) { [weak self] in
                self?.view.layoutIfNeeded()
                self?.spiningCircle.alpha = 1
            } completion: { [weak self] _ in
                UIView.animate(withDuration: 1) {
                    self?.spiningCircle.alpha = 0
                    self?.view.layoutIfNeeded()
                }
            }
        }
    }
   
    //MARK: სიმღერა / მომღერლის დამატება სტეკში
    func addStack(){
        view.addSubview(musicDescription)
        NSLayoutConstraint.activate([
        musicDescription.topAnchor.constraint(equalTo: view.topAnchor, constant: 463),
        musicDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        musicDescription.widthAnchor.constraint(equalToConstant: 245),
        musicDescription.heightAnchor.constraint(equalToConstant: 63)
        ])
        configureStack()
    }
    
    func configureStack(){
        let name = UILabel()
        name.text = "Taylor Swift"
        name.textColor = .white
        name.font = .systemFont(ofSize: 18)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        let music = UILabel()
        music.text = "So Long, London"
        music.font = .systemFont(ofSize: 24)
        music.textColor = .white
        music.translatesAutoresizingMaskIntoConstraints = false
        
        musicDescription.addArrangedSubview(music)
        musicDescription.addArrangedSubview(name)
    }
    
    //MARK: add progressView
    func addprogressVIew(){
        view.addSubview(progressBar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.topAnchor.constraint(equalTo: musicDescription.bottomAnchor, constant: 34).isActive = true
        progressBar.widthAnchor.constraint(equalToConstant: 332).isActive  = true
        progressBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        progressBar.setProgress(0, animated: false)
    
        
    }
    
    //MARK: add buttonStack

    func addButtonStack(){
        view.addSubview(buttonStack)
        NSLayoutConstraint.activate([
        buttonStack.topAnchor.constraint(equalTo: progressBar.bottomAnchor, constant: 52),
        buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        buttonStack.widthAnchor.constraint(equalToConstant: 334),
//        buttonStack.heightAnchor.constraint(equalToConstant: 74)
        ])
        configButtonsStack()
    }
    //MARK: displays stack
    func configButtonsStack(){
        shuffle.image = UIImage(systemName: "shuffle")
        left.image = UIImage(systemName: "backward.end")
        right.image = UIImage(systemName: "forward.end")
        repeatImg.image = UIImage(systemName: "repeat")
        
        pauseBtn.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
        pauseBtn.imageView?.translatesAutoresizingMaskIntoConstraints = false
        pauseBtn.imageView?.widthAnchor.constraint(equalToConstant: 76).isActive = true
        pauseBtn.imageView?.heightAnchor.constraint(equalToConstant: 74).isActive = true
        pauseBtn.addTarget(self, action: #selector(handleTapped), for: .touchUpInside)
        
        buttonStack.addArrangedSubview(shuffle)
        buttonStack.addArrangedSubview(left)
        buttonStack.addArrangedSubview(pauseBtn)
        buttonStack.addArrangedSubview(right)
        buttonStack.addArrangedSubview(repeatImg)
    }
    
    func addbottomVIew(){
        view.addSubview(bottonView)
        bottonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        bottonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        bottonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 25).isActive = true
        bottonView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        bottonView.backgroundColor = UIColor(named: "bottomVIew")
        addBottomVIewsymbols()
    }
    
    func addBottomStack(){
        bottonView.addSubview(bottomSymbolStack)
        NSLayoutConstraint.activate([
            bottomSymbolStack.centerXAnchor.constraint(equalTo: bottonView.centerXAnchor),
            bottomSymbolStack.topAnchor.constraint(equalTo: bottonView.topAnchor, constant: 23),
            bottomSymbolStack.widthAnchor.constraint(equalToConstant: 37.8),
            bottomSymbolStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 24)
        ])
    }
    
    
   //MARK: qveda simboloebis kontreitebi
    func addBottomVIewsymbols(){
        
     
        
        bottonView.addSubview(home)
        bottonView.addSubview(music)
        bottonView.addSubview(heart)
        home.image = UIImage(systemName: "house")
        music.image = UIImage(systemName: "music.note")
        heart.image = UIImage(systemName: "heart")
        
        home.translatesAutoresizingMaskIntoConstraints = false
        music.translatesAutoresizingMaskIntoConstraints = false
        heart.translatesAutoresizingMaskIntoConstraints = false
        
        
        topconstrait = home.topAnchor.constraint(equalTo: bottonView.topAnchor, constant: 23)
        topconstrait?.isActive = true
        widthconstrait = home.widthAnchor.constraint(equalToConstant: 24)
        widthconstrait?.isActive = true
        heightconstrait = home.heightAnchor.constraint(equalToConstant: 24)
        heightconstrait?.isActive = true
        home.leadingAnchor.constraint(equalTo: bottonView.leadingAnchor, constant: 38).isActive = true
        
        topconstrait = music.topAnchor.constraint(equalTo: bottonView.topAnchor, constant: 23)
        topconstrait?.isActive = true
        widthconstrait = music.widthAnchor.constraint(equalToConstant: 24)
        widthconstrait?.isActive = true
        heightconstrait = music.heightAnchor.constraint(equalToConstant: 24)
        heightconstrait?.isActive = true
        music.centerXAnchor.constraint(equalTo: bottonView.centerXAnchor ).isActive = true
        
        topconstrait = heart.topAnchor.constraint(equalTo: bottonView.topAnchor, constant: 23)
        topconstrait?.isActive = true
        widthconstrait = heart.widthAnchor.constraint(equalToConstant: 24)
        widthconstrait?.isActive = true
        heightconstrait = heart.heightAnchor.constraint(equalToConstant: 24)
        heightconstrait?.isActive = true
        heart.trailingAnchor.constraint(equalTo: bottonView.trailingAnchor, constant: -38).isActive = true
    }
    
    
    
    //MARK: modify image

    func imageModifyToSmall(){
        UIView.animate(withDuration: 1, animations: {
            self.image.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        })
    }
    
    func imageModifyTolarge(){
        UIView.animate(withDuration: 1, animations: {
            self.image.transform = .identity
        })
    }
    
    //MARK: prgores view apdeiti
    
   @objc func updateProgressbar(){
        progress += 0.01
               progressBar.setProgress(progress, animated: true)
               
        if progress >= 1.0 {
            timer?.invalidate()
        }
    }
    
    
    //MARK: button clciked
    @objc func handleTapped(){
        if isPlaying {
            isPlaying = false
            imageModifyToSmall()
            pauseBtn.setImage(UIImage(systemName: "play.circle.fill"), for: .normal)
            timer?.invalidate()
            
        }else {
            isPlaying = true
            imageModifyTolarge()
            pauseBtn.setImage(UIImage(systemName: "pause.circle.fill"), for: .normal)
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateProgressbar), userInfo: nil, repeats: true)
            showSpin()
        }
        
    }
    
    

}


//MARK: spinings calke view


class SpinnignView: UIView {
    
    
    let spiningCircle = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSpin()
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSpin(){
        frame = CGRect()
        
        let rect = self.bounds
        let circularPath = UIBezierPath(ovalIn: rect)
        
        spiningCircle.path = circularPath.cgPath
        spiningCircle.fillColor = UIColor.clear.cgColor
        spiningCircle.strokeColor = UIColor.systemGray.cgColor
        spiningCircle.lineWidth = 10
        spiningCircle.strokeEnd = 0.25
        spiningCircle.lineCap = .round
        self.layer.addSublayer(spiningCircle)
    }
    
    func animateSpinning(){
        UIView.animate(withDuration: 1, delay: 0,  options: .curveLinear , animations: {
            self.transform = CGAffineTransform(rotationAngle: .pi)
        }) { (completed) in
            UIView.animate(withDuration: 1, delay: 0,  options: .curveLinear , animations: {
                self.transform = CGAffineTransform(rotationAngle: 0)
            }) { (completed) in
                self.animateSpinning()
            }
        }
    }
}
