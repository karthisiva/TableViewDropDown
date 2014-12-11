//
//  dropDownViewController.m
//  tableViewDropDownBY
//
//  Created by Subramani B R on 7/25/14.
//  Copyright (c) 2014 Subramani B R. All rights reserved.
//

#import "dropDownViewController.h"
#import "suggestedTableViewCell.h"
#import "AppDelegate.h"
#define UIColorFromRGB(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define isIPad (([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) ? NO : YES)
@interface dropDownViewController ()

@end

@implementation dropDownViewController
@synthesize checkedData;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!isIPad)
    {
        self.btn = [[UIButton alloc] initWithFrame:CGRectMake(60,152, 241, 38)];
        [self.btn setImage:[UIImage imageNamed:@"arrow_down.png"] forState:UIControlStateNormal];
        [self.btn addTarget:self action:@selector(list) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.btn];
        
        self.lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(0,0,211,38)];
        self.lblTitle.textColor = [UIColor blackColor];
        self.lblTitle.userInteractionEnabled = NO;
        self.lblTitle.text = @"Send suggestion";
        self.lblTitle.font = [UIFont boldSystemFontOfSize:13.0];
        self.lblTitle.textAlignment = NSTextAlignmentLeft;
        [self.btn addSubview:self.lblTitle];
        CGRect rectFrame=CGRectMake(30, 192,220,0);
        self.table=[[UITableView alloc]initWithFrame:rectFrame style:UITableViewStylePlain];
        self.table.delegate = self;
        self.table.dataSource = self;
        [self.view addSubview:self.table];
    }
    else
    {
        self.btn = [[UIButton alloc] initWithFrame:CGRectMake(60,152, 241, 38)];
        [self.btn setImage:[UIImage imageNamed:@"arrow_down.png"] forState:UIControlStateNormal];
        [self.btn addTarget:self action:@selector(list) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:self.btn];
        
        self.lblTitle = [[UILabel alloc]initWithFrame:CGRectMake(0,0,211,38)];
        self.lblTitle.textColor = [UIColor blackColor];
        self.lblTitle.userInteractionEnabled = NO;
        self.lblTitle.text = @"Send suggestion";
        self.lblTitle.font = [UIFont boldSystemFontOfSize:13.0];
        self.lblTitle.textAlignment = NSTextAlignmentLeft;
        [self.btn addSubview:self.lblTitle];
        CGRect rectFrame=CGRectMake(30, 192,220,0);
        self.table=[[UITableView alloc]initWithFrame:rectFrame style:UITableViewStylePlain];
        self.table.delegate = self;
        self.table.dataSource = self;
        [self.view addSubview:self.table];
    }
    
    
   }
   

-(void)list
{
    if (self.btn.currentImage == [UIImage imageNamed:@"arrow_down.png"])
    {
       
        [self.btn setImage:[UIImage imageNamed:@"arrow_up.png"] forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.55 animations:^{
            
           self.table.frame=CGRectMake(30, 192,220,250);
            
        } completion:^(BOOL finished) {
            NSLog(@"suggestion");
        }];

       
    }
    else
    {
    
        [self.btn setImage:[UIImage imageNamed:@"arrow_down.png"] forState:UIControlStateNormal];
        [UIView animateWithDuration:0.55 animations:^{
            
            self.table.frame=CGRectMake(30, 192,220,0);

            
        } completion:^(BOOL finished) {
            NSLog(@"suggestion");
        }];

    }

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *Identifier = @"ceelll";
    suggestedTableViewCell *cell =(suggestedTableViewCell *) [tableView dequeueReusableCellWithIdentifier:Identifier];
    if (cell==nil) {
        NSArray *arr;
        if (!isIPad) {
            arr=[[NSBundle mainBundle]loadNibNamed:@"suggestedTableViewCell" owner:self options:nil];
        }
        else
        {
            arr=[[NSBundle mainBundle]loadNibNamed:@"suggestedCell_ipad" owner:self options:nil];
        }
        cell=[arr objectAtIndex:0];
    }


    cell.backgroundColor = UIColorFromRGB(0Xd4d4d4);
    cell.lblString.text = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    if(self.checkedData != nil && indexPath.row == self.checkedData.row)
//    {
//        cell.imgae.image=[UIImage imageNamed:@"check_box_on.png"];
//    }
//    else
//    {
//        cell.imgae.image=[UIImage imageNamed:@"check_box_off.png"];
//    }
    if([self.checkedData isEqual:indexPath])
    {
        cell.image.image=[UIImage imageNamed:@"check_box_on.png"];

    }
    else
    {
        cell.image.image=[UIImage imageNamed:@"check_box_off.png"];
    }
       return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(self.checkedData)
    {
        suggestedTableViewCell* cell =(suggestedTableViewCell*) [tableView
                                        cellForRowAtIndexPath:self.checkedData];
            cell.image.image=[UIImage imageNamed:@"check_box_off.png"];
    }
    if([self.checkedData isEqual:indexPath])
    {
        self.checkedData = nil;
    }
    else
    {
        suggestedTableViewCell* cell =(suggestedTableViewCell*) [tableView
                                                           cellForRowAtIndexPath:indexPath];
        cell.image.image=[UIImage imageNamed:@"check_box_on.png"];

       self.checkedData = indexPath;
    }
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSIndexPath *previousSelection = self.checkedData;
//    NSArray *array = nil;
//    if (nil != previousSelection)
//    {
//
//        array = [NSArray arrayWithObjects:previousSelection, indexPath, nil];
//
//    } else
//    {
//        array = [NSArray arrayWithObject:indexPath];
//    }
//
//    self.checkedData = indexPath;
//    
//    [tableView reloadRowsAtIndexPaths:array withRowAnimation: UITableViewRowAnimationNone];
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
