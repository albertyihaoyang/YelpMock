//
//  YelpDataStore.h
//  Yelp
//
//  Created by 杨以皓 on 10/18/17.
//  Copyright © 2017 yyh. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;
@class YelpDataModel;

@interface YelpDataStore : NSObject
@property (nonatomic, copy) NSArray <YelpDataModel *> *dataModels;
@property (nonatomic) CLLocation *userLocation;

+ (YelpDataStore *)sharedInstance;

@end

