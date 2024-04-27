//
//  detailMainPageView.swift
//  mvvm
//
//  Created by vano Kvakhadze on 24.04.24.
//

import UIKit

protocol detailPageViewDelegate: AnyObject {
    func googlemapOpen()
    func openStreetMap()
}

class DetailPageView: UIView {
    // MARK: PROPERTY
    
        var safeZones: UIView
        var image: UIImageView
        var countryImage: String?
        var abouCountry:  UILabel
        var flagInfo: UITextView
        var line1: UIView
        var line2: UIView
        var scrollview: UIScrollView
        var viewInScroll: UIView
        var informationLabel:UILabel
        var oficialname:UILabel
        var valueOfname:UILabel
        var capital:UILabel
        var valueOfcapital: UILabel
        var region: UILabel
        var valueOfRegion: UILabel
        var subRegion: UILabel
        var valueOfsubregion: UILabel
        var population: UILabel
        var valueOfPopulation: UILabel
        var neighbours: UILabel
        var valueOfneighbours: UILabel
        var links:  UILabel
        var googleMap: UIButton
        var streetMap: UIButton
    
        
    override init(frame: CGRect) {
         safeZones = UIView()
         image =  UIImageView()
         abouCountry =  UILabel.customLabel()
         flagInfo = UITextView()
         line1 = UIView()
         line2 = UIView()
         scrollview = UIScrollView()
         viewInScroll = UIView()
         informationLabel = UILabel.customLabel()
         oficialname = UILabel.customLabel()
         valueOfname = UILabel.customLabel()
         capital = UILabel.customLabel()
         valueOfcapital = UILabel.customLabel()
         region = UILabel.customLabel()
         valueOfRegion = UILabel.customLabel()
         subRegion = UILabel.customLabel()
         valueOfsubregion = UILabel.customLabel()
         population = UILabel.customLabel()
         valueOfPopulation = UILabel.customLabel()
         neighbours = UILabel.customLabel()
         valueOfneighbours = UILabel.customLabel()
         links =  UILabel.customLabel()
         googleMap = UIButton()
         streetMap = UIButton()

        super.init(frame: frame)

            addSafeZone()
            addConfig()
            addiLinksTitle()
            infomation()
            addLines()
            addButtons()

        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: set delegate
    weak var delegate: detailPageViewDelegate?
        
        //MARK: setup UI
        
        
        func addSafeZone(){
            backgroundColor = .systemBackground
            addSubview(safeZones)
            let area = self.safeAreaLayoutGuide
            safeZones.topAnchor.constraint(equalTo: area.topAnchor).isActive = true
            safeZones.leadingAnchor.constraint(equalTo: area.leadingAnchor).isActive = true
            safeZones.trailingAnchor.constraint(equalTo: area.trailingAnchor).isActive = true
            safeZones.bottomAnchor.constraint(equalTo: area.bottomAnchor).isActive = true
            safeZones.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        func addConfig(){
            safeZones.addSubview(image)
            image.translatesAutoresizingMaskIntoConstraints = false
            image.contentMode = .scaleAspectFill
            image.layer.cornerRadius = 30
            image.layer.masksToBounds = true
            
            safeZones.addSubview(abouCountry)
            abouCountry.text = "About the Flag"
            abouCountry.font = .boldSystemFont(ofSize: 16)
            safeZones.addSubview(flagInfo)
            flagInfo.translatesAutoresizingMaskIntoConstraints = false
            flagInfo.backgroundColor = .clear

            
            
            
            NSLayoutConstraint.activate([
                image.topAnchor.constraint(equalTo: safeZones.topAnchor, constant: 20),
                image.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor),
                image.widthAnchor.constraint(equalToConstant: 343),
                image.heightAnchor.constraint(equalToConstant: 228),
               
                
                abouCountry.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 25),
                abouCountry.leadingAnchor.constraint(equalTo: safeZones.leadingAnchor, constant: 24),
                abouCountry.widthAnchor.constraint(equalToConstant: 130),
                abouCountry.heightAnchor.constraint(equalToConstant: 19),
                
                flagInfo.topAnchor.constraint(equalTo: abouCountry.bottomAnchor, constant: 15),
                flagInfo.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor),
                flagInfo.widthAnchor.constraint(equalToConstant: 325),
                flagInfo.heightAnchor.constraint(equalToConstant: 80)
               
            ])
          
        }
        // MARK: scroll view
        func infomation(){
            safeZones.addSubview(scrollview)
            scrollview.addSubview(viewInScroll)
            scrollview.translatesAutoresizingMaskIntoConstraints = false
            viewInScroll.translatesAutoresizingMaskIntoConstraints = false
            
            let scrolling = viewInScroll.heightAnchor.constraint(equalTo: scrollview.heightAnchor, multiplier: 1.5)
            scrolling.isActive = true
            scrolling.priority = UILayoutPriority(100)
            
            viewInScroll.addSubview(informationLabel)
            viewInScroll.addSubview(oficialname)
            viewInScroll.addSubview(valueOfname)
            viewInScroll.addSubview(capital)
            viewInScroll.addSubview(valueOfcapital)
            viewInScroll.addSubview(region)
            viewInScroll.addSubview(valueOfRegion)
            viewInScroll.addSubview(subRegion)
            viewInScroll.addSubview(valueOfsubregion)
            viewInScroll.addSubview(population)
            viewInScroll.addSubview(valueOfPopulation)
            viewInScroll.addSubview(neighbours)
            viewInScroll.addSubview(valueOfneighbours)
           
            addlabelInScroll()

            //MARK: add scrollview
            NSLayoutConstraint.activate([
            scrollview.topAnchor.constraint(equalTo: flagInfo.bottomAnchor, constant: 40),
            scrollview.trailingAnchor.constraint(equalTo: safeZones.trailingAnchor, constant: -24),

            scrollview.leadingAnchor.constraint(equalTo: safeZones.leadingAnchor, constant: 24),
            scrollview.heightAnchor.constraint(equalToConstant: 180),
            
            //MARK: view in scroll view
            viewInScroll.topAnchor.constraint(equalTo: scrollview.topAnchor),
            viewInScroll.leadingAnchor.constraint(equalTo: scrollview.leadingAnchor),
            viewInScroll.trailingAnchor.constraint(equalTo: scrollview.trailingAnchor),
            viewInScroll.bottomAnchor.constraint(equalTo: scrollview.bottomAnchor),
            viewInScroll.widthAnchor.constraint(equalTo: scrollview.widthAnchor),
            
            //MARK: add Labels
            informationLabel.topAnchor.constraint(equalTo: viewInScroll.topAnchor),
            informationLabel.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor),
            oficialname.topAnchor.constraint(equalTo: informationLabel.bottomAnchor,constant:  15),
            oficialname.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor),
            valueOfname.topAnchor.constraint(equalTo: informationLabel.bottomAnchor, constant: 15),
            valueOfname.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            capital.topAnchor.constraint(equalTo: oficialname.bottomAnchor, constant: 15),
            capital.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor),
            valueOfcapital.topAnchor.constraint(equalTo: oficialname.bottomAnchor, constant: 15),
            valueOfcapital.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            region.topAnchor.constraint(equalTo: capital.bottomAnchor, constant: 15),
            region.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor),
            valueOfRegion.topAnchor.constraint(equalTo: capital.bottomAnchor, constant: 15),
            valueOfRegion.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            subRegion.topAnchor.constraint(equalTo: region.bottomAnchor, constant: 15),
            subRegion.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor),
            valueOfsubregion.topAnchor.constraint(equalTo: region.bottomAnchor, constant: 15),
            valueOfsubregion.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            population.topAnchor.constraint(equalTo: subRegion.bottomAnchor, constant: 15),
            population.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor),
            valueOfPopulation.topAnchor.constraint(equalTo: subRegion.bottomAnchor, constant: 15),
            valueOfPopulation.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            neighbours.topAnchor.constraint(equalTo: population.bottomAnchor, constant: 15),
            neighbours.leadingAnchor.constraint(equalTo: viewInScroll.leadingAnchor),
            valueOfneighbours.topAnchor.constraint(equalTo: population.bottomAnchor, constant: 15),
            valueOfneighbours.trailingAnchor.constraint(equalTo: viewInScroll.trailingAnchor),
            
            
            ])
        }
        
        func addlabelInScroll(){
            informationLabel.text = "Basic infromation"
            informationLabel.font = .boldSystemFont(ofSize: 19)
            
            oficialname.text = "Official Name"
            capital.text = "Capital"
            region.text = "Region"
            subRegion.text = "Subregion"
            population.text = "Population"
            
        }
        
    

      
        func addiLinksTitle(){
            safeZones.addSubview(links)
          links.bottomAnchor.constraint(equalTo: safeZones.bottomAnchor, constant: -70).isActive = true
            links.leadingAnchor.constraint(equalTo: safeZones.leadingAnchor, constant: 24).isActive = true
            links.heightAnchor.constraint(equalToConstant: 19).isActive = true
            links.text = "Useful Links"
            links.font = .boldSystemFont(ofSize: 16)
        }
    
    // MARK: Button
        
       private func addButtons(){
            safeZones.addSubview(googleMap)
            safeZones.addSubview(streetMap)
            
            let img = UIImage(named: "googleMap")
            googleMap.setImage(img, for: .normal)
            googleMap.layer.cornerRadius = 25
            
           
            googleMap.topAnchor.constraint(equalTo: links.bottomAnchor, constant: 15).isActive = true
            googleMap.trailingAnchor.constraint(equalTo: safeZones.trailingAnchor, constant: -94).isActive = true
            googleMap.widthAnchor.constraint(equalToConstant: 50).isActive = true
            googleMap.heightAnchor.constraint(equalToConstant: 50).isActive = true
            googleMap.layer.borderWidth = 1
            googleMap.translatesAutoresizingMaskIntoConstraints = false
            
            
            let img1 = UIImage(named: "streetMap")
            streetMap.setImage(img1, for: .normal)
            streetMap.layer.cornerRadius = 25
            
            streetMap.translatesAutoresizingMaskIntoConstraints = false
            streetMap.topAnchor.constraint(equalTo: links.bottomAnchor, constant: 15).isActive = true
            streetMap.leadingAnchor.constraint(equalTo: safeZones.leadingAnchor, constant: 94).isActive = true
            streetMap.widthAnchor.constraint(equalToConstant: 50).isActive = true
            streetMap.heightAnchor.constraint(equalToConstant: 50).isActive = true
            streetMap.layer.borderWidth = 1
            
            
            googleMap.addAction(UIAction(handler: { _ in
                self.googlemap()
            }), for: .touchUpInside)
            
            streetMap.addAction(UIAction(handler: { _ in 
                self.openStreet()
            }), for: .touchUpInside)
            
     
            
        }
    
    // MARK: recieve delegate
        
       private func googlemap(){
            delegate?.googlemapOpen()
           
        }
              
        private func openStreet(){
            delegate?.openStreetMap()
           
        }
       
        
        
        // MARK: add lines
        func addLines(){
            safeZones.addSubview(line1)
            safeZones.addSubview(line2)
            line1.backgroundColor = .gray
            line1.translatesAutoresizingMaskIntoConstraints = false
            line2.backgroundColor = .gray
            line2.translatesAutoresizingMaskIntoConstraints = false
            
            
            NSLayoutConstraint.activate([
                line1.topAnchor.constraint(equalTo: flagInfo.bottomAnchor, constant: 20),
                line1.heightAnchor.constraint(equalToConstant: 1),
                line1.leadingAnchor.constraint(equalTo: safeZones.leadingAnchor, constant: 32),
                line1.trailingAnchor.constraint(equalTo: safeZones.trailingAnchor, constant: -31),
                line2.topAnchor.constraint(equalTo: links.topAnchor, constant: -20),
                line2.heightAnchor.constraint(equalToConstant: 1),
                line2.leadingAnchor.constraint(equalTo: safeZones.leadingAnchor, constant: 32),
                line2.trailingAnchor.constraint(equalTo: safeZones.trailingAnchor, constant: -31)])
            
        }

}

//MARK: set up viewController

class DetailPageViewController: UIViewController, detailPageViewDelegate {
    
    var detailsView: DetailPageView
    var viewModel: DetailPageViewModel
    
    init(viewModel: DetailPageViewModel) {
        self.detailsView = DetailPageView()
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
        detailsView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailsView

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpDetail()


    }
    
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "")
        }
    
    //MARK: set up data 

    func setUpDetail(){

        
        if let imgURL = URL(string: (viewModel.flag)){
            detailsView.image.loadImage(from: imgURL)
        }
        detailsView.flagInfo.text = viewModel.aboutFlag
        
        detailsView.valueOfname.text = viewModel.officialName
        detailsView.valueOfcapital.text = viewModel.capital
        detailsView.valueOfsubregion.text = viewModel.subRegion
        detailsView.valueOfRegion.text = viewModel.Region
        detailsView.valueOfPopulation.text = "\(viewModel.population)"
       
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.title = viewModel.commonName
    }
    
    func googlemapOpen(){
        
        if let url  = URL(string: (viewModel.GoogleMapLink)) {
            UIApplication.shared.open(url)
        }
        
    }
    
    func openStreetMap() {
        
        if let url  = URL(string: (viewModel.streetMapLink)) {
            UIApplication.shared.open(url)
            
        }
       
    }
    
   

}
