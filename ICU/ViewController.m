//
//  ViewController.m
//  ICU
//
//  Created by 陈曦翔 on 4/4/15.
//  Copyright (c) 2015 Xixiang Chen. All rights reserved.
//
#import "ViewController.h"
#import "SubCategoryViewController.h"
#import "ItchAndPainViewController.h"
#import "TypingViewController.h"
#import "MainCategory.h"
#import "MainCategoryCVCell.h"

#import "Voice.h"
#import "Language.h"
@interface ViewController ()

@end

@implementation ViewController{
    UIButton *backButton;
    UIButton *nextButton;
    NSMutableArray* array;
    MainCategory *selectedCategory;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.categoryArray = [self loadJSONFile];
    [self createNavigationalButton];
    self.title=@"AMC";
    self.settingButton.title = [Language get:@"Settings" alter:nil];
    

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.settingButton.title = [Language get:@"Settings" alter:nil];
    [self.collectionView reloadData];
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
    [self.collectionView.superview addSubview:nextButton];
    nextButton.hidden = YES;
    
    //back button
    NSString* file1 = [[NSBundle mainBundle] pathForResource:@"backArrow" ofType:@"png"];
    UIImage* image1 = [UIImage imageWithContentsOfFile:file1];
    backButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 50, 50)];
    backButton.layer.cornerRadius = 25;
    [backButton setBackgroundImage:image1 forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(scrollBackTap) forControlEvents:UIControlEventTouchDown];
    [backButton addTarget:self action:@selector(scrollBackRelease) forControlEvents:UIControlEventTouchUpInside];
    [self.collectionView.superview addSubview:backButton];
    backButton.hidden = YES;
}

//scroll button behaviors
-(void) scrollNextTap
{
    nextButton.backgroundColor = [UIColor yellowColor];
    NSArray *visibleItems = [self.collectionView indexPathsForVisibleItems];
    NSIndexPath *currentItem = [visibleItems objectAtIndex:0];
    NSIndexPath *nextItem = [NSIndexPath indexPathForItem:currentItem.item + 1 inSection:currentItem.section];
    [self.collectionView scrollToItemAtIndexPath:nextItem atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    //NSLog(@"visible item counts: %lu",(unsigned long)visibleItems.count);
}
-(void) scrollNextRelease
{
    nextButton.backgroundColor = [UIColor clearColor];
}
-(void) scrollBackTap
{
    backButton.backgroundColor = [UIColor yellowColor];
    NSArray *visibleItems = [self.collectionView indexPathsForVisibleItems];
    NSIndexPath *currentItem = [visibleItems objectAtIndex:0];
    NSIndexPath *nextItem;
    if(currentItem.item - 1 <0){
         nextItem= [NSIndexPath indexPathForItem:0 inSection:currentItem.section];
    }
    else{
        nextItem = [NSIndexPath indexPathForItem:currentItem.item - 1 inSection:currentItem.section];
    }
    [self.collectionView scrollToItemAtIndexPath:nextItem atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
}
-(void) scrollBackRelease
{
    backButton.backgroundColor = [UIColor clearColor];
}
//end scroll button behavior


-(NSMutableArray*)loadJSONFile
{
    NSString *path = [[[NSBundle mainBundle]resourcePath] stringByAppendingPathComponent:@"ICU.json"];
    NSData *data = [[NSData alloc]initWithContentsOfFile:path];
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data
                                                            options:NSJSONReadingMutableContainers
                                                              error:nil];
    NSMutableArray *categoryArray = [NSMutableArray array];
    
    if(jsonDic){
        int i=0;
        for(id categoryDic in [jsonDic objectForKey:@"categories"]){
            i++;
            MainCategory* category = [[MainCategory alloc]initWithDictionary:categoryDic];
            [categoryArray addObject:category];
            //NSLog(@"%@",[NSString stringWithFormat:@"%i category name:%@",i,categName]);
        }
    }
    return categoryArray;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_categoryArray count];
}


-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MainCategoryCVCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    MainCategory* thisCategory = ((MainCategory*)[_categoryArray objectAtIndex:indexPath.row]);
    [self initCollectionCellWithCell:cell andMainCategory:thisCategory];
    return cell;
}

-(void) initCollectionCellWithCell:(MainCategoryCVCell*)cell andMainCategory:(MainCategory*)thisCategory
{
    cell.categoryName.text = [Language get:thisCategory.categoryName alter:nil];
    // need to edit according to the path within the json file
    // sound file
    BOOL voiceOn = [Voice getVoiceBool];
    if(voiceOn)
    {
        NSString* file = [Language get:thisCategory.soundFile alter:nil];
        NSString* soundFilePath = [[NSBundle mainBundle] pathForResource:file ofType:@"mp3"];
        [cell.playButton setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"media/icon/play" ofType:@"png"]] forState:UIControlStateNormal];
        cell.playButton.layer.cornerRadius=cell.playButton.frame.size.width/2;
        NSURL *soundFileURL = [NSURL fileURLWithPath:soundFilePath];
        cell.soundFileURL = soundFileURL;
        cell.playButton.hidden=NO;
    }
    else{
        cell.playButton.hidden=YES;
    }
    // icon file
    NSString* iconFile = [[NSBundle mainBundle] pathForResource:@"media/icon/test" ofType:@"png"];
    // change should be completed above
    
    UIImage* image = [UIImage imageWithContentsOfFile:iconFile];
    [cell.iconImageView setImage:image];
    [cell.layer setBorderWidth:2.0f];
    [cell.layer setBorderColor:[UIColor whiteColor].CGColor];
    [cell.layer setCornerRadius:50.0];
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;
}



-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    selectedCategory =   (MainCategory*)  [self.categoryArray objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor greenColor];

    if([selectedCategory.categoryName isEqualToString:@"itch"]||[selectedCategory.categoryName isEqualToString:@"pain"]){
         [self performSegueWithIdentifier:@"itchOrPain" sender:self];
    }else{
        
        if ([selectedCategory.categoryName isEqualToString:@"typing"]) {
            [self performSegueWithIdentifier:@"typing" sender:self];
        }else{
            [self performSegueWithIdentifier:@"subcategory" sender:self];
        
        }
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"%@",segue.identifier);
    if([segue.identifier isEqualToString:@"itchOrPain"]){
        ItchAndPainViewController* itchPainVC = (ItchAndPainViewController*) [segue destinationViewController];
        itchPainVC.mainCategory = selectedCategory;
    }
    if ([segue.identifier isEqualToString:@"typing"]){
        TypingViewController* typingVC = (TypingViewController *) [segue destinationViewController];
        typingVC.mainCategory = selectedCategory;
    }
    if([segue.identifier isEqualToString:@"subcategory"]){
        SubCategoryViewController* subCatVC = (SubCategoryViewController *)[segue destinationViewController] ;
        subCatVC.mainCategory = selectedCategory;
    }
}

-(void)scrollViewDidScroll: (UIScrollView*)scrollView
{
    float scrollViewWidth = scrollView.frame.size.width;
    float scrollContentSizeWidth = scrollView.contentSize.width;
    float scrollOffset = scrollView.contentOffset.x;
    
    if (scrollOffset <=0)
    {
        //NSLog(@"we are at the beginning");
        nextButton.hidden=NO;
        backButton.hidden=YES;
        
        // then we are at the top
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


- (IBAction)testLanguageChange:(id)sender {
    NSString *currentLanguage = [Language getCurrentLanguage];
    if ([currentLanguage isEqualToString:@"en"])
    {
        [Language setLanguage:@"fr"];
    }else if ([currentLanguage isEqualToString:@"es"])
    {
        [Language setLanguage:@"en"];
    }else if ([currentLanguage isEqualToString:@"fr"])
    {
        [Language setLanguage:@"es"];
    }
    

    [self.collectionView reloadData];
    
}
@end
