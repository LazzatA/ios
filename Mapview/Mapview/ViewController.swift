//
//  ViewController.swift
//  Mapview
//
//  Created by okokok on 11.02.2024.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, UIGestureRecognizerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var mapview: MKMapView!
    
    let locationManager = CLLocationManager()
    
    var userLocation = CLLocation()
    
    var followMe = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Запрашиваем разрешение на использование местоположения пользователя
        locationManager.requestWhenInUseAuthorization()
        //делеегт нужен для дидАпдейтЛок, котороя вызывается при обновлений местоположения(для этого приписали СЛЛ)
        locationManager.delegate = self
        //Запускаем слежку за пользователем
        locationManager.startUpdatingLocation()
        
        
        
        let mapDragRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.didDragMAP))
        mapDragRecognizer.delegate = self
        mapview.addGestureRecognizer(mapDragRecognizer)
        
        
        
        //------------Метка на карте----------
        //новые координаты для метки на карте
        let lat:CLLocationDegrees = 37.957666
        let long:CLLocationDegrees = -122.0323133
        
        // Sozdaem koordinatu peredavaiya dolgotu i shirotu
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        
        //sozdaem metku na karte
        let anotation = MKPointAnnotation()
        
        //Zadaem koordinaty metke
        anotation.coordinate = location
        //zadaem name metke
        anotation.title = "Title"
        //zadaem opisanie metke
        anotation.subtitle = "subtitle"
        
        //add point to map
        mapview.addAnnotation(anotation)
        //------------Метка на карте----------
        
        //настраиваем долгое нажатие-добавляем новые метки на карту
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressAction))
        //мин 2 секуды
        longPress.minimumPressDuration = 2
        mapview.addGestureRecognizer(longPress)
        // мапвьюделегейт чтоб отслеживать нажатие на метки на карте(метод дидСелект)
        mapview.delegate = self
        
        
    }
    
    
    //вызывается каждый раз при изменений местополодения нашего пользователя
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        userLocation = locations[0]//координаты пользователя
        
        print(userLocation)
        
        if followMe{
            //delta - naskolko otdalitsia ot user coordinate
            let latDelta:CLLocationDegrees = 0.01
            let longDelta:CLLocationDegrees = 0.01
            
            //create region long and late according to Delta
            let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
            //create region na karte with own coordinates in center
            let region = MKCoordinateRegion(center: userLocation.coordinate, span: span)
            //priblizhaem kartu c animation v danny region
            mapview.setRegion(region, animated: true)
        }
    }
    
    
    
    @IBAction func showMyLocation(_ sender: Any) {
        followMe = true
    }
    
    // вызывается когда двигаем карту
    
    @objc func didDragMAP(gestureRecognizer: UIGestureRecognizer){
        //как только начали двигать карту
        if (gestureRecognizer.state == UIGestureRecognizer.State.began){
            //говорим не следовать за пользователем
            followMe = false
            print("Map drag began")
        }
        
        
        //когда закончили двигат карту
        if (gestureRecognizer.state == UIGestureRecognizer.State.ended){
            print("Map drag ended")
        }
    }
    
    
    
    @objc func longPressAction(gestureRecognizer: UIGestureRecognizer){
        print("gestureRecognizer")
        
        let touchPoint = gestureRecognizer.location(in: mapview)
        
        let newCoor: CLLocationCoordinate2D = mapview.convert(touchPoint,toCoordinateFrom: mapview)
        
        let anotation = MKPointAnnotation()
        anotation.coordinate = newCoor
        
        anotation.title = "Title"
        anotation.subtitle = "subtitle"
        
        mapview.addAnnotation(anotation)
        
    }
    
    
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print(view.annotation?.title)
        
        let location:CLLocation = CLLocation(latitude: (view.annotation?.coordinate.latitude)!, longitude: (view.annotation?.coordinate.longitude)!)
        
        let meters:CLLocationDistance = location.distance(from: userLocation)
        distanceLabel.text = String(format: "Distance: %.2f m", meters)
        
        let sourceLocation = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        
        let destinationLocation = CLLocationCoordinate2D(latitude: (view.annotation?.coordinate.latitude)!, longitude:(view.annotation?.coordinate.longitude)!)
        
        let sourcePlacemark = MKPlacemark(coordinate: sourceLocation, addressDictionary: nil)
        
        let destinationPlacemark = MKPlacemark(coordinate: destinationLocation, addressDictionary: nil)
        
        let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
        let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        
        directions.calculate{
            (response, error) -> Void in
            
            guard let response = response else {
                if let error = error{
                    print("Error: \(error)")
                }
                return
            }
            let route = response.routes[0]
            self.mapview.addOverlay((route.polyline), level: MKOverlayLevel.aboveRoads)
            
            let rect = route.polyline.boundingMapRect
            self.mapview.setRegion(MKCoordinateRegion(rect), animated: true)
        }
        
        
    }
    
    func mapView(_ mapView: MKMapView, renderedFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 4.0
        
        return renderer
    }
    
}

