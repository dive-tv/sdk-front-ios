//
//  Map.swift
//  SDKFrontiOS
//
//  Created by Sergio Girao on 25/10/16.
//  Copyright © 2016 Tagsonomy. All rights reserved.
//

import UIKit
import MapKit

class Map: Module {

    @IBOutlet weak var viewBackground : UIView!;
    @IBOutlet weak var labelTitleModule : UILabel!;
    @IBOutlet weak var mapView : MKMapView!;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override class func validate(_ cardDetail : CardDetail) throws {
        guard let container = cardDetail.containers[ContainerContentType.Location] , container.data.count > 0 else{
            // TODO: create error
            try DataModelErrors.ThrowError(DataModelErrors.CreateCardDetailErrors.emptyData);
            return;
        }
    }
    
    
    override func setCardDetail(_ _configModule: ConfigModule, _cardDetail: CardDetail) {
        super.setCardDetail(_configModule, _cardDetail: _cardDetail);
        // TODO: need to put the color of the background
        self.viewBackground.backgroundColor = UIColor.yellow;
        
        // TODO: need to put the localizable strings
        self.labelTitleModule.text = "Mapa".uppercased();
        
        
        // This is not needed because if not pass the validate this will never be call
        if let container = self.cardDetail.containers[ContainerContentType.Location], let mapContainer = container.data.first as? MapContainerData{
            
            let lat : CLLocationDegrees = Double(mapContainer.latitude);
            let lon : CLLocationDegrees = Double(mapContainer.longitude);
            
            
            let location = CLLocation(latitude: lat,longitude: lon);
            let region = MKCoordinateRegionMake(location.coordinate, MKCoordinateSpan(latitudeDelta: CLLocationDegrees(mapContainer.zoom), longitudeDelta: CLLocationDegrees(mapContainer.zoom)));
            
            mapView.setRegion(region, animated: true);
            
            let annotation = MKPointAnnotation()
            
            annotation.coordinate = location.coordinate;
            
            self.mapView.addAnnotation(annotation);
            
        }
        
        
    }
    
}
