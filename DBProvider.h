//
//  DBProvider.h
//  iost3h
//
//  Created by Hoang on 9/5/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "sqlite3.h"

@interface DBProvider : NSObject
-(NSString *)getDBPath;
@end
