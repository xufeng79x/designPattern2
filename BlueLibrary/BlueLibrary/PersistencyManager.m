//
//  PersistencyManager.m
//  BlueLibrary
//
//  Created by apple on 16/2/22.
//  Copyright © 2016年 Eli Ganem. All rights reserved.
//

#import "PersistencyManager.h"

@interface PersistencyManager () {
    // an array of all albums
    NSMutableArray *albums;
}
@end


@implementation PersistencyManager

- (id)init
{
    self = [super init];
    if (self) {
        NSData *data = [NSData dataWithContentsOfFile:[NSHomeDirectory() stringByAppendingString:@"/Documents/albums.bin"]];
        albums = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        if (albums == nil)
        {
            albums = [NSMutableArray arrayWithArray:
                      @[[[Album alloc] initWithTitle:@"Best of Bowie" artist:@"David Bowie" coverUrl:@"http://musicdata.baidu.com/data2/pic/122819029/122819029.jpg" year:@"1992"],
                        [[Album alloc] initWithTitle:@"It's My Life" artist:@"No Doubt" coverUrl:@"http://b.hiphotos.baidu.com/ting/abpic/item/d000baa1cd11728b0d5fc2bec9fcc3cec3fd2c3f.jpg" year:@"2003"],
                        [[Album alloc] initWithTitle:@"Nothing Like The Sun" artist:@"Sting" coverUrl:@"http://musicdata.baidu.com/data2/pic/118743792/118743792.jpg" year:@"1999"],
                        [[Album alloc] initWithTitle:@"Staring at the Sun" artist:@"U2" coverUrl:@"http://musicdata.baidu.com/data2/pic/117415481/117415481.jpg" year:@"2000"],
                        [[Album alloc] initWithTitle:@"American Pie" artist:@"Madonna" coverUrl:@"http://musicdata.baidu.com/data2/pic/102334731/102334731.jpg" year:@"2000"]]];
            [self saveAlbums];
        }
    }
    return self;
}


- (NSArray*)getAlbums
{
    return albums;
}

- (void)addAlbum:(Album*)album atIndex:(int)index
{
    if (albums.count >= index)
        [albums insertObject:album atIndex:index];
    else
        [albums addObject:album];
}

- (void)deleteAlbumAtIndex:(int)index
{
    [albums removeObjectAtIndex:index];
}



- (void)saveImage:(UIImage*)image filename:(NSString*)filename
{
    filename = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", filename];
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:filename atomically:YES];
}

- (UIImage*)getImage:(NSString*)filename
{
    filename = [NSHomeDirectory() stringByAppendingFormat:@"/Documents/%@", filename];
    NSData *data = [NSData dataWithContentsOfFile:filename];
    return [UIImage imageWithData:data];
}

- (void)saveAlbums
{
    NSString *filename = [NSHomeDirectory() stringByAppendingString:@"/Documents/albums.bin"];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:albums];
    [data writeToFile:filename atomically:YES];
}

@end
