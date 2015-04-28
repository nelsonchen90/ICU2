//
//  SubCategoryViewController.m
//  ICU
//
//  Created by Muddassar Mubeen on 4/10/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//

#import "SubCategoryViewController.h"
#import "ClockViewController.h"
#import "CalendarViewController.h"

#import "SubcategoryCVCell.h"
#import "Language.h"
#import "Voice.h"
@interface SubCategoryViewController ()

@end

@implementation SubCategoryViewController{
    UIButton *backButton;
    UIButton *nextButton;
    SubCategory *selectedCategory;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.SubcategoryCollectionView.delegate=self;
    self.SubcategoryCollectionView.dataSource = self;
    [self createNavigationalButton];
    self.title=[Language get:self.mainCategory.categoryName alter:nil];
    //self.testSubName.text=self.mainCategory.categoryName;
    // Do any additional setup after loading the view.
}


-(void) createNavigationalButton
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    
    //next button
    NSString* file = [[NSBundle mainBundle] pathForResource:@"nextArrow" ofType:@"png"];
    UIImage* image = [UIImage imageWithContentsOfFile:file];
    nextButton = [[UIButton alloc] initWithFrame:CGRectMake(screenWidth-70, 100, 50, 50)];
    nextButton.layer.cornerRadius = 25;
    [nextButton setBackgroundImage:image forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(scrollNextTap) forControlEvents:UIControlEventTouchDown];
    [nextButton addTarget:self action:@selector(scrollNextRelease) forControlEvents:UIControlEventTouchUpInside];
    [self.SubcategoryCollectionView.superview addSubview:nextButton];
    nextButton.hidden = YES;
    
    //back button
    NSString* file1 = [[NSBundle mainBundle] pathForResource:@"backArrow" ofType:@"png"];
    UIImage* image1 = [UIImage imageWithContentsOfFile:file1];
    backButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 50, 50)];
    backButton.layer.cornerRadius = 25;
    [backButton setBackgroundImage:image1 forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(scrollBackTap) forControlEvents:UIControlEventTouchDown];
    [backButton addTarget:self action:@selector(scrollBackRelease) forControlEvents:UIControlEventTouchUpInside];
    [self.SubcategoryCollectionView.superview addSubview:backButton];
    backButton.hidden = YES;
}

//scroll button behaviors
-(void) scrollNextTap
{
    nextButton.backgroundColor = [UIColor yellowColor];
    NSArray *visibleItems = [self.SubcategoryCollectionView indexPathsForVisibleItems];
    NSIndexPath *currentItem = [visibleItems objectAtIndex:0];
    NSIndexPath *nextItem =[NSIndexPath indexPathForItem:currentItem.item + 1 inSection:currentItem.section];
    if (nextItem.item>=_mainCategory.subcategoriesList.count) {
        nextItem = [NSIndexPath indexPathForItem: _mainCategory.subcategoriesList.count-1 inSection:currentItem.section];
    }
//    if(currentItem.item<=visibleItems.count){
//        nextItem= [NSIndexPath indexPathForItem:currentItem.item + 1 inSection:currentItem.section];
//        NSLog(@"current.item <= visible items");
//    }else{
//        nextItem = [NSIndexPath indexPathForItem:currentItem.item  inSection:currentItem.section];
//        NSLog(@"current.item > visible items");
//    }
//    
//    NSLog(@"visible item counts: %lu",(unsigned long)visibleItems.count);
//    NSLog(@"current item : %lu",(unsigned long)currentItem.item);
//    NSLog(@"next item : %lu",(unsigned long)nextItem.item);
    [self.SubcategoryCollectionView scrollToItemAtIndexPath:nextItem atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}
-(void) scrollNextRelease
{
    nextButton.backgroundColor = [UIColor clearColor];
}
-(void) scrollBackTap
{
    backButton.backgroundColor = [UIColor yellowColor];
    NSArray *visibleItems = [self.SubcategoryCollectionView indexPathsForVisibleItems];
    NSIndexPath *currentItem = [visibleItems objectAtIndex:0];
    NSIndexPath *nextItem;
    if(currentItem.item - 1 <0){
        nextItem= [NSIndexPath indexPathForItem:0 inSection:currentItem.section];
    }
    else{
        nextItem = [NSIndexPath indexPathForItem:currentItem.item - 1 inSection:currentItem.section];
    }
    [self.SubcategoryCollectionView scrollToItemAtIndexPath:nextItem atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
}
-(void) scrollBackRelease
{
    backButton.backgroundColor = [UIColor clearColor];
}
//end scroll button behavior


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.mainCategory.subcategoriesList count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    SubcategoryCVCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"subcategoryCell" forIndexPath:indexPath];
    SubCategory* sub = ((SubCategory*)[self.mainCategory.subcategoriesList objectAtIndex:indexPath.row]);
    [self initCollectionCellWithCell:cell andMainCategory:sub];
    
    return cell;
}

-(void) initCollectionCellWithCell:(SubcategoryCVCell*)cell andMainCategory:(SubCategory*)sub
{
    NSString* path = [NSString stringWithFormat:@"%@%@",_mainCategory.subcategoriesIconDirectory,sub.fileName];
    NSString* iconFilePath = [[NSBundle mainBundle] pathForResource:path ofType:@"png"];
    UIImage* image = [UIImage imageWithContentsOfFile:iconFilePath];
    // need to edit according to the path within the json file
    BOOL voiceOn=[Voice getVoiceBool];
    if(voiceOn)
    {
        // sound file
        NSString* soundPath = [NSString stringWithFormat:@"%@%@",[Language get:_mainCategory.subcategoriesSoundFileDirectory alter:nil],sub.fileName];
        NSString* soundFilePath = [[NSBundle mainBundle] pathForResource:soundPath ofType:@"mp3"];
        // change should be completed above
        
        [cell.playButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"media/icon/play" ofType:@"png"]] forState:UIControlStateNormal];
        cell.playButton.layer.cornerRadius=cell.playButton.frame.size.width/2;
        NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
        cell.soundFileURL = soundFileURL;
        cell.playButton.hidden=NO;
    }else
    {
        cell.playButton.hidden = YES;
    }
    
    [cell.iconImageView setImage:image];
    cell.subcategoryName.text = [Language get:sub.subcategoryName alter:nil];
    cell.subcategoryDescription.text = [Language get:sub.categoryDescription alter:nil];
    [cell.layer setBorderWidth:2.0f];
    [cell.layer setBorderColor:[UIColor whiteColor].CGColor];
    [cell.layer setCornerRadius:50.0];
}
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    selectedCategory =   (SubCategory*)  [self.mainCategory.subcategoriesList objectAtIndex:indexPath.row];
    if([selectedCategory.subcategoryName isEqualToString:@"Clock"])
    {
        [self performSegueWithIdentifier:@"clock" sender:self];
    }else if([selectedCategory.subcategoryName isEqualToString:@"Calendar"])
    {
        [self performSegueWithIdentifier:@"calendar" sender:self];
    }
}

//scroll view delegate method to controll scroll button display
-(void)scrollViewDidScroll: (UIScrollView*)scrollView
{
    float scrollViewWidth = scrollView.frame.size.width;
    float scrollContentSizeWidth = scrollView.contentSize.width;
    float scrollOffset = scrollView.contentOffset.x;
    
    if (scrollOffset <= 0)
    {
        //NSLog(@"we are at the beginning");
        nextButton.hidden=NO;
        backButton.hidden=YES;
    }
    else if (scrollOffset + scrollViewWidth >= scrollContentSizeWidth)
    {
        //NSLog(@" we are at the end");
        backButton.hidden=NO;
        nextButton.hidden=YES;
    }
    else
    {
        backButton.hidden=NO;
        nextButton.hidden=NO;
    }
}

//-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
//    selectedCategory =   (MainCategory*)  [self.categoryArray objectAtIndex:indexPath.row];
//    cell.backgroundColor = [UIColor greenColor];
//    [self performSegueWithIdentifier:@"subcategory" sender:self];
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@",segue.identifier);

}

@end
