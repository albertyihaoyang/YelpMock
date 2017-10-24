//
//  MapTableViewCell.h
//  Yelp
//
//  Created by 杨以皓 on 10/22/17.
//  Copyright © 2017 yyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YelpDataModel;

@interface MapTableViewCell : UITableViewCell

- (void)updateBasedOnDataModel:(YelpDataModel *)dataModel;

@end

