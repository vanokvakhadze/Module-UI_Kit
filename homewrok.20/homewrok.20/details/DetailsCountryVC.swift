//
//  DetailsCountryVC.swift
//  homewrok.20
//
//  Created by vano Kvakhadze on 21.04.24.
//

import UIKit

class DetailsCountryVC: UIViewController {
    var details: Countries?
    var withBorderd: String?

    let safeZones: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleOfpage = UILabel.customLabel()
    
    let image =  UIImageView()
    
    var countryImage: String?
    
    let abouCountry =  UILabel.customLabel()
    
    let flagInfo: UITextView = {
        let txt = UITextView()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.backgroundColor = .clear
        return txt
    }()
    
    let scrollview: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let viewInScroll: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
       // view.backgroundColor = .gray
        return view
    }()
    
    let informationLabel = UILabel.customLabel()
    let oficialname = UILabel.customLabel()
    let valueOfname = UILabel.customLabel()
    let capital = UILabel.customLabel()
    let valueOfcapital =  UILabel.customLabel()
    let region = UILabel.customLabel()
    let valueOfRegion = UILabel.customLabel()
    let subRegion = UILabel.customLabel()
    let valueOfsubregion = UILabel.customLabel()
    let population = UILabel.customLabel()
    let valueOfPopulation = UILabel.customLabel()
    let neighbours = UILabel.customLabel()
    let valueOfneighbours = UILabel.customLabel()
   
    
    let links =  UILabel.customLabel()
    
    let googleMap: UIButton = {
        let btn = UIButton()
        let img = UIImage(named: "googlemap")
        btn.setImage(img, for: .normal)
        btn.layer.cornerRadius = 25
        return btn
    }()
    
    let streetMap: UIButton = {
        let btn = UIButton()
        let img = UIImage(named: "street")
        btn.setImage(img, for: .normal)
        btn.layer.cornerRadius = 25
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSafeZone()
        addtitle()
        addConfig()
        addiLinksTitle()
        setUpDetail()
        infomation()
        addButtons()

    }
    
    func addSafeZone(){
        view.backgroundColor = .white
        view.addSubview(safeZones)
        let area = view.safeAreaLayoutGuide
        safeZones.topAnchor.constraint(equalTo: area.topAnchor).isActive = true
        safeZones.leadingAnchor.constraint(equalTo: area.leadingAnchor).isActive = true
        safeZones.trailingAnchor.constraint(equalTo: area.trailingAnchor).isActive = true
        safeZones.bottomAnchor.constraint(equalTo: area.bottomAnchor).isActive = true
    }
    
    func addtitle(){
        safeZones.addSubview(titleOfpage)
        titleOfpage.topAnchor.constraint(equalTo: safeZones.topAnchor, constant: 0).isActive = true
        titleOfpage.centerXAnchor.constraint(equalTo: safeZones.centerXAnchor).isActive = true
        titleOfpage.font = .boldSystemFont(ofSize: 16)
        
        
    }
    
    func addConfig(){
        safeZones.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 30
        safeZones.addSubview(abouCountry)
        abouCountry.text = "About the Flag"
        abouCountry.font = .boldSystemFont(ofSize: 16)
        safeZones.addSubview(flagInfo)
        
        
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: titleOfpage.bottomAnchor, constant: 29),
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
        scrollview.heightAnchor.constraint(equalToConstant: 190),
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
        neighbours.text = "Neighbours"
    }
    
    //MARK: add detail
    
    func setUpDetail() {
        guard let detail = details else { return  }
        titleOfpage.text = detail.name?.common
        if let imgURL = URL(string: (detail.flags?.png)!){
            image.loadImage(from: imgURL)
        }
        flagInfo.text = detail.flags?.alt
        
        valueOfname.text = detail.name?.official
        valueOfcapital.text = detail.capital?.first
        valueOfsubregion.text = detail.subregion
        valueOfRegion.text = detail.region
        valueOfPopulation.text = "\(detail.population!)"
        
        guard  let neibhourCountry = detail.borders else { return }
        
            for country in neibhourCountry {
                withBorderd = country
            }
            valueOfneighbours.text = withBorderd
            print(withBorderd!)
        
    }

  
    func addiLinksTitle(){
        safeZones.addSubview(links)
      links.bottomAnchor.constraint(equalTo: safeZones.bottomAnchor, constant: -70).isActive = true
        links.leadingAnchor.constraint(equalTo: safeZones.leadingAnchor, constant: 24).isActive = true
        links.heightAnchor.constraint(equalToConstant: 19).isActive = true
        links.text = "Useful Links"
        links.font = .boldSystemFont(ofSize: 16)
    }
    
    func addButtons(){
        safeZones.addSubview(googleMap)
        safeZones.addSubview(streetMap)
        
       
        googleMap.topAnchor.constraint(equalTo: links.bottomAnchor, constant: 15).isActive = true
        googleMap.trailingAnchor.constraint(equalTo: safeZones.trailingAnchor, constant: -94).isActive = true
        googleMap.widthAnchor.constraint(equalToConstant: 50).isActive = true
        googleMap.heightAnchor.constraint(equalToConstant: 50).isActive = true
        googleMap.layer.borderWidth = 1
        
        googleMap.translatesAutoresizingMaskIntoConstraints = false
        streetMap.translatesAutoresizingMaskIntoConstraints = false
        streetMap.topAnchor.constraint(equalTo: links.bottomAnchor, constant: 15).isActive = true
        streetMap.leadingAnchor.constraint(equalTo: safeZones.leadingAnchor, constant: 94).isActive = true
        streetMap.widthAnchor.constraint(equalToConstant: 50).isActive = true
        streetMap.heightAnchor.constraint(equalToConstant: 50).isActive = true
        streetMap.layer.borderWidth = 1
        
        
        googleMap.addAction(UIAction(handler: { _ in
            self.googlemapOpen()
        }), for: .touchUpInside)
        
        streetMap.addAction(UIAction(handler: { _ in self.openStreetMap()
        }), for: .touchUpInside)
        
    }
    
    
    func googlemapOpen(){
        guard let detail = details else { return }
        
        if let url  = URL(string: (detail.maps?.googleMaps)!) {
            UIApplication.shared.open(url)
        }
        
    }
    
    func openStreetMap() {
        guard let detail = details else { return }
        
        if let url  = URL(string: (detail.maps?.openStreetMaps)!) {
            UIApplication.shared.open(url)
        }
    }
    
}
    
 


#Preview{
    DetailsCountryVC()
}
