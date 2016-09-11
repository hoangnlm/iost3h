//
//  MonAnDAO.h
//  iost3h
//
//  Created by Hoang on 9/7/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import "DBProvider.h"

@interface MonAnDAO : DBProvider
-(NSMutableArray *)getListMonAn;
+(NSMutableArray *)getListMonAn;
-(BOOL)saveMonAn: (MonAn *) monAn;
-(BOOL)deleteMonAn: (MonAn *) monAn;
@end
