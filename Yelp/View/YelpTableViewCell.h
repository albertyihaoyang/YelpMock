//
//  YelpTableViewCell.h
//  Yelp
//
//  Created by 杨以皓 on 10/14/17.
//  Copyright © 2017 yyh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YelpDataModel;

@interface YelpTableViewCell : UITableViewCell

- (void)updateBasedOnDataModel:(YelpDataModel *)dataModel;

@end

