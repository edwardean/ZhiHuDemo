//
//  ZHViewController.m
//  ZHDemo
//
//  Created by Edward on 13-7-20.
//  Copyright (c) 2013年 ZhiHu. All rights reserved.
//

#import "ZHViewController.h"

@interface ZHViewController ()

@end

@implementation ZHViewController
@synthesize myTableView = myTableView_;
@synthesize arrayOfSections = arrayOfSections_;

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
  
  self.arrayOfSections = [[NSMutableArray alloc] init];
  NSMutableArray *section1 = [self newSectionWithIndex:1 withCellCount:3];
  NSMutableArray *section2 = [self newSectionWithIndex:2 withCellCount:3];
  NSMutableArray *section3 = [self newSectionWithIndex:3 withCellCount:3];
  [arrayOfSections_ addObject:section1];
  [arrayOfSections_ addObject:section2];
  [arrayOfSections_ addObject:section3];
  self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
  
  self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
  
  myTableView_.delegate = self;
  myTableView_.dataSource = self;
  
  //添加右按钮
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"MoveSection" style:UIBarButtonItemStylePlain target:self action:@selector(movewSection1ToSection3)];
  //添加左按钮
  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"MoveCell" style:UIBarButtonItemStylePlain target:self action:@selector(moveCell2InSectionToCellInSection2)];
  [self.view addSubview:myTableView_];
	
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)newSectionWithIndex:(NSUInteger)paramIndex withCellCount:(NSUInteger)paramCellCount
{
	NSMutableArray *result = [[NSMutableArray alloc] init];
  NSUInteger counter = 0;
  for (counter = 0; counter < paramCellCount; counter ++) {
    [result addObject:[[NSString alloc] initWithFormat:@"Section %lu Cell %lu",(unsigned long)paramIndex,(unsigned long)counter + 1]];
  }
  
  return result;
}

//Section行数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  NSInteger result = 0;
  if ([tableView isEqual:myTableView_]) {
    result = (NSInteger)[self.arrayOfSections count];
  }
  return result;
}


//每个Section中的Cell行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  NSInteger result = 0;
  if ([tableView isEqual:myTableView_]) {
    if ([arrayOfSections_ count]>section) {
      NSMutableArray *sectionArray = [self.arrayOfSections objectAtIndex:section];
      result = (NSInteger)[sectionArray count];
    }
  }
  return result;
}


//设置每行Cell的内容

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  UITableViewCell *result = nil;
  if ([tableView isEqual:myTableView_]) {
    static NSString *CellIdentifier = @"CellIdentifier";
    result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
  }
  NSMutableArray *sectionArray = [self.arrayOfSections objectAtIndex:indexPath.section];
  result.textLabel.text = [sectionArray objectAtIndex:indexPath.row];
  return result;
}

//将第一个索引位置的Section移动放到最后一个位置
-(void)movewSection1ToSection3{
  NSMutableArray *section1 = [self.arrayOfSections objectAtIndex:0];
  [self.arrayOfSections removeObject:section1];
  [self.arrayOfSections addObject:section1];
  
  [myTableView_ moveSection:0 toSection:2];
}

//将第一个Section中的第一个Cell和第二个互换
-(void)moveCell1InSectionToCell2InSection1{
  NSMutableArray *section1 = [self.arrayOfSections objectAtIndex:0];
  NSString *cell1InSection1 = [section1 objectAtIndex:0];
  [section1 removeObject:cell1InSection1];
  [section1 insertObject:cell1InSection1 atIndex:1];
  NSIndexPath *sourceIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
  NSIndexPath *destinationIdexPath = [NSIndexPath indexPathForRow:1 inSection:0];
  [self.myTableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIdexPath];
}

//将第一个Section的第二个Cell移动到第二个Section的第一个Cell之前的位置
-(void)moveCell2InSectionToCellInSection2{
  NSMutableArray *section1 = [arrayOfSections_ objectAtIndex:0];
  NSMutableArray *section2 = [arrayOfSections_ objectAtIndex:1];
  
  NSString *cell2InSection1 = [section1 objectAtIndex:1];
  [section1 removeObject:cell2InSection1];
  [section2 insertObject:cell2InSection1 atIndex:0];
  
  NSIndexPath *sourceIndexPath = [NSIndexPath indexPathForRow:1 inSection:0];
  NSIndexPath *destinationIndexPath = [NSIndexPath indexPathForRow:0 inSection:1];
  
  [myTableView_ moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}

@end
