//
//  Album.h
//  BlueLibrary
//
//  Created by apple on 16/2/22.
//  Copyright © 2016年 Eli Ganem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Album : NSObject <NSCoding>

@property (nonatomic, copy, readonly) NSString *title, *artist, *genre, *coverUrl, *year;

- (id)initWithTitle:(NSString*)title artist:(NSString*)artist coverUrl:(NSString*)coverUrl year:(NSString*)year;

@end
