//
//  dropDownViewController.h
//  tableViewDropDownBY
//
//  Created by Subramani B R on 7/25/14.
//  Copyright (c) 2014 Subramani B R. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dropDownViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
}
@property(nonatomic,retain)IBOutlet UILabel *lblTitle;
@property(nonatomic,retain)IBOutlet UIButton *btn;

@property(nonatomic,retain)IBOutlet UITableView *table;
@property(nonatomic, retain) NSIndexPath *checkedData;


@end
