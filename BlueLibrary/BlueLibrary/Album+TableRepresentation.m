//
//  Album+TableRepresentation.m
//  BlueLibrary
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 Eli Ganem. All rights reserved.
//

#import "Album+TableRepresentation.h"

@implementation Album (TableRepresentation)
- (NSDictionary*)tr_tableRepresentation
{
    return @{@"titles":@[@"Artist", @"Album", @"Genre", @"Year"],
             @"values":@[self.artist, self.title, self.genre, self.year]};
}
@end
