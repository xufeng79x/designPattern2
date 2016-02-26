//
//  PersistencyManager.h
//  BlueLibrary
//
//  Created by apple on 16/2/22.
//  Copyright © 2016年 Eli Ganem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Album.h"

@interface PersistencyManager : NSObject
- (NSArray*)getAlbums;
- (void)addAlbum:(Album*)album atIndex:(int)index;
- (void)deleteAlbumAtIndex:(int)index;

- (void)saveImage:(UIImage*)image filename:(NSString*)filename;
- (UIImage*)getImage:(NSString*)filename;

- (void)saveAlbums;
@end
