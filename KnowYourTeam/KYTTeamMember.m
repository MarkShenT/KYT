//
//  KYTTeamMember.m
//  KnowYourTeam
//
//  Created by DDC.Mac2 on 9/6/17.
//  Copyright © 2017 DDC.Mac2. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KYTTeamMember.h"
#import "KYTStringValidation.h"

@interface KYTTeamMember()

@end

@implementation KYTTeamMember

- (id) initWithFirstName:(NSString*)newFirstName
          withLastName:(NSString*)newLastName
          withTitle:(NSString*)newTitle
          withPhoto:(UIImage*)newPhotoURL
{
    self = [super init];
    
    // First and Last Name must not be empty
    if ([newFirstName isEqualToString:@""] || [newLastName isEqualToString:@""]) {
        return nil;
    }
    
    // First and Last Name must not contain special characters
    if ([KYTStringValidation containsSpecialCharacters:newFirstName] || [KYTStringValidation containsSpecialCharacters:newLastName]){
        return nil;
    }
  
    if (self) {
        self.firstName = newFirstName;
        self.lastName = newLastName;
        self.title = newTitle;
        self.photo = newPhotoURL;
    }
    
    return self;
}

@end
