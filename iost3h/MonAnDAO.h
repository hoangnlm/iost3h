//
//  MonAnDAO.h
//  iost3h
//
//  Created by Hoang on 9/7/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import "DBProvider.h"

@interface MonAnDAO : DBProvider
-(NSMutableArray *)getListMonAnWithOption:(id)option;
+(NSMutableArray *)getListMonAnWithOption:(id)option;
-(BOOL)saveMonAn: (MonAn *) monAn;
-(BOOL)deleteMonAn: (MonAn *) monAn;
@end
