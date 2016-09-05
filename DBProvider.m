//
//  DBProvider.m
//  iost3h
//
//  Created by Hoang on 9/5/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import "DBProvider.h"

@implementation DBProvider

// Copy file db vao thu muc document cua device
-(NSString *)getDBPath{
    // Lay duong dan den folder chua db tren device
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@", kDBFileName]];
    NSFileManager *fm = [NSFileManager defaultManager];
    if (![fm fileExistsAtPath:path]) {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:kDBFileName ofType:nil];
        NSError *error;
        [fm copyItemAtPath:bundlePath toPath:path error:&error];
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
            // Xu ly loi khi khong copy duoc db
        } else {
            NSLog(@"Copied at: %@", path);
        }
    } else {
        NSLog(@"File already existed at: %@", path);
    }
    return path;
}

@end
