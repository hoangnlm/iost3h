//
//  MonAnDAO.m
//  iost3h
//
//  Created by Hoang on 9/7/16.
//  Copyright © 2016 Hoang. All rights reserved.
//

#import "MonAnDAO.h"

@implementation MonAnDAO
-(NSMutableArray *)getListMonAn{
    NSMutableArray *listMonAn = [NSMutableArray new];
    NSString *query = @"select * from monan";
    sqlite3_stmt *statement = [super getStatementFromQuery:query];
    if (statement) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            // Truy xuat gia tri tai tung column
            int uid = sqlite3_column_int(statement, 0);
            char *ten = (char *)sqlite3_column_text(statement, 1);
            char *mota = (char *)sqlite3_column_text(statement, 2);
            char *nguyenlieu = (char *)sqlite3_column_text(statement, 3);
            char *cachnau = (char *)sqlite3_column_text(statement, 4);
            char *image = (char *)sqlite3_column_text(statement, 5);
            char *video = (char *)sqlite3_column_text(statement, 6);
            char *link = (char *)sqlite3_column_text(statement, 7);
            // Khoi tao mon an
            MonAn *monan = [MonAn new];
            monan._id = uid;
            monan._ten = [NSString stringWithUTF8String:ten];
            monan._mota = mota==NULL ? nil : [NSString stringWithUTF8String:mota];
            monan._nguyenlieu = nguyenlieu==NULL ? nil : [NSString stringWithUTF8String:nguyenlieu];
            monan._cachnau = cachnau==NULL ? nil : [NSString stringWithUTF8String:cachnau];
            monan._image = image==NULL ? nil : [NSString stringWithUTF8String:image];
            monan._video = video==NULL ? nil : [NSString stringWithUTF8String:video];
            monan._link = link==NULL ? nil : [NSString stringWithUTF8String:link];
            // Them mon an vao danh sach
            [listMonAn addObject:monan];
        }
        //Giai phong statement
        sqlite3_finalize(statement);
    }
    return listMonAn;
}

-(BOOL)insertMonAn: (MonAn *) monAn{
    
    return false;
}

-(BOOL)updateMonAn: (MonAn *)monAn{
    
    return  false;
}

-(BOOL)deleteMonAn: (MonAn *) monAn{
    
    return false;
}
@end
