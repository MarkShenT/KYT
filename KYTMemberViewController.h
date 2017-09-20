//
//  KYTMemberViewController.h
//  KnowYourTeam
//
//  Created by DDC.Mac2 on 9/7/17.
//  Copyright © 2017 DDC.Mac2. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KYTTeamMember.h"
#import "KYTCustomAlerts.h"

@class KYTImageSelectorDelegate;

@interface KYTMemberViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTxt;
@property (weak, nonatomic) IBOutlet UITextField *lastNameText;
@property (weak, nonatomic) IBOutlet UIImageView *memberImage;

@property (strong, atomic) KYTTeamMember *member;
@property (strong, atomic) UIImagePickerController *imagePickerController;
@property (strong, atomic) KYTImageSelectorDelegate *imageSelectorDelegate;
@property (nonatomic) NSUInteger itemIndex;

@end
