//
//  Album+TableRepresentation.h
//  BlueLibrary
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 Eli Ganem. All rights reserved.
//

#import "Album.h"

@interface Album (TableRepresentation)
- (NSDictionary*)tr_tableRepresentation;
@end
