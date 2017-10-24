//
//  MapTableViewCell.m
//  Yelp
//
//  Created by 杨以皓 on 10/22/17.
//  Copyright © 2017 yyh. All rights reserved.
//


#import "MapTableViewCell.h"
#import "YelpDataModel.h"
#import "YelpAnnotation.h"
@import MapKit;

@interface MapTableViewCell ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapTableViewCell

- (void)updateBasedOnDataModel:(YelpDataModel *)dataModel
{
    CLLocationCoordinate2D loc = CLLocationCoordinate2DMake(dataModel.latitude, dataModel.longitude);
    NSString *subtitle = [NSString stringWithFormat:@"%@ - %@",dataModel.categories,dataModel.displayAddress];
    YelpAnnotation *annotation = [[YelpAnnotation alloc] initWithCoordinate:loc title:dataModel.name subtitle:subtitle dataModel:dataModel];
    [self.mapView addAnnotation:annotation];
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(loc, 500, 500);
    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
    
    [self.mapView setRegion:adjustedRegion animated:YES];
    self.mapView.showsUserLocation = YES;
    [self.mapView setCenterCoordinate:loc];
}

@end
