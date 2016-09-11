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
        // Copy file db vao device
        [fm copyItemAtPath:bundlePath toPath:path error:&error];
        if (error) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
//            NSLog(@"Copied at: %@", path);
            // Tao folder Images trong device
            NSString *imageFolder = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Images"];
            BOOL isDirectory;
            BOOL canCreateDirectory = NO;
            if (![fm fileExistsAtPath:imageFolder isDirectory:&isDirectory]) {
                canCreateDirectory = YES;
            } else if (!isDirectory) {
                canCreateDirectory = YES;
            }
            if (canCreateDirectory) {
                [fm createDirectoryAtPath:imageFolder withIntermediateDirectories:NO attributes:nil error:&error];
                if (error) {
                    NSLog(@"Error creating image folder: %@", error.localizedDescription);
                } else {
                    // Copy image vao device
                    NSString *filename;
                    for (int i=1; i<=8; i++) {
                        if (i<10) {
                            filename = [NSString stringWithFormat:@"mon000%d", i];
                        }
                        if (10<=i && i<=99) {
                            filename = [NSString stringWithFormat:@"mon00%d", i];
                        }
                        if (100<=i && i<=999) {
                            filename = [NSString stringWithFormat:@"mon0%d", i];
                        }
                        if (1000<=i && i<=9999) {
                            filename = [NSString stringWithFormat:@"mon%d", i];
                        }
                        NSString *source = [[NSBundle mainBundle] pathForResource:filename ofType:@"png"];
                        NSString *destination = [NSString stringWithFormat:@"%@/%@.png", imageFolder, filename];
                        [fm copyItemAtPath:source toPath:destination error:&error];
                        if (error) {
                            NSLog(@"Error copy images: %@", error.localizedDescription);
                        }
                    }
                }
            }
        }
    }
    return path;
}

// Tra ve 1 statement khoi tao tu truy van
-(sqlite3_stmt *)getStatementFromQuery:(NSString *)query{
    // Lay duong dan den folder chua db tren device
    NSString *path = [self getDBPath];
//    NSLog(@"Path: %@", path);
    // Mo ket noi den DB
    if (sqlite3_open([path UTF8String], &_DB) == SQLITE_OK) {
        // Khoi tao statement
        sqlite3_stmt *statement;
        // Khoi tao truy van
        if (sqlite3_prepare_v2(_DB, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
            return statement;
        }
    }
    return nil;
}

@end
