//
//  KYTPageInitViewController.m
//  KnowYourTeam
//
//  Created by DDC.Mac2 on 9/18/17.
//  Copyright © 2017 DDC.Mac2. All rights reserved.
//

#import "KYTPageInitViewController.h"
//#import "KYTPageItemViewController.h"
#import "KYTTeamMemberPersistence.h"
#import "KYTMemberViewController.h"
#import "KYTTeamMember.h"

@interface KYTPageInitViewController ()

@end

@implementation KYTPageInitViewController

#pragma mark View Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createPageViewController];
    [self setupPageControl];
}

- (void)createPageViewController
{
    _members = [KYTTeamMemberPersistence readFileToArray:TEAM_MEMBER_FILE_NAME];
    
    UIPageViewController *pageController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageController"];
    
    pageController.dataSource = self;
    
    if([_members count])
    {
        NSArray *startingViewControllers = @[[self itemControllerForIndex:0]]; //Member data in page view
        [pageController setViewControllers:startingViewControllers
                                 direction:UIPageViewControllerNavigationDirectionForward
                                  animated:NO
                                completion:nil];
    }
    
    self.pageViewController = pageController;
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

- (void)setupPageControl
{
    [[UIPageControl appearance] setPageIndicatorTintColor:[UIColor grayColor]];
    [[UIPageControl appearance] setCurrentPageIndicatorTintColor:[UIColor whiteColor]];
    [[UIPageControl appearance] setBackgroundColor:[UIColor darkGrayColor]];
}

#pragma mark UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    KYTMemberViewController *itemController = (KYTMemberViewController *)viewController;
    
    if (itemController.itemIndex > 0)
    {
        return [self itemControllerForIndex:itemController.itemIndex-1];
    }
    
    return nil;
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    KYTMemberViewController *itemController = (KYTMemberViewController *)viewController;
    
    if (itemController.itemIndex+1 < [_members count])
    {
        return [self itemControllerForIndex:itemController.itemIndex+1];
    }
    
    return nil;
}

- (KYTMemberViewController *)itemControllerForIndex:(NSUInteger)itemIndex
{
    if (itemIndex < [_members count])
    {
        KYTMemberViewController *pageItemViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ItemController"];
        pageItemViewController.itemIndex = itemIndex;
        pageItemViewController.member = _members[itemIndex];
        return pageItemViewController;
    }
    
    return nil;
}

#pragma mark Page Indicator

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [_members count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0; //Sets page that is viewed from array
}

#pragma mark - Additions

- (NSUInteger)currentControllerIndex
{
    KYTMemberViewController *pageItemViewController = (KYTMemberViewController *) [self currentController];
    
    if (pageItemViewController)
    {
        return pageItemViewController.itemIndex;
    }
    
    return -1;
}

- (UIViewController *)currentController
{
    if ([self.pageViewController.viewControllers count])
    {
        return self.pageViewController.viewControllers[0];
    }
    
    return nil;
}


@end