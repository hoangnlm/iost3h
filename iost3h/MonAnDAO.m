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
    super.statement = [super getStatementFromQuery:query];
    if (super.statement) {
        while (sqlite3_step(super.statement) == SQLITE_ROW) {
            // Truy xuat gia tri tai tung column
            int uid = sqlite3_column_int(super.statement, 0);
            char *ten = (char *)sqlite3_column_text(super.statement, 1);
            char *mota = (char *)sqlite3_column_text(super.statement, 2);
            char *nguyenlieu = (char *)sqlite3_column_text(super.statement, 3);
            char *cachnau = (char *)sqlite3_column_text(super.statement, 4);
            char *image = (char *)sqlite3_column_text(super.statement, 5);
            char *video = (char *)sqlite3_column_text(super.statement, 6);
            char *link = (char *)sqlite3_column_text(super.statement, 7);
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
        sqlite3_finalize(super.statement);
    }
    return listMonAn;
}

+(NSMutableArray *)getListMonAn{
    return [[MonAnDAO new] getListMonAn];
}

-(BOOL)saveMonAn: (MonAn *)monAn{
    BOOL result = NO;
    NSString *query;
    if (monAn._id) {    // Update mon an
    query = [NSString stringWithFormat:@"update monan set ten=?, mota=?, nguyenlieu=?, cachnau=?, image=?, video=?, link=? where id=%ld", monAn._id];
    } else {                    // Insert mon an moi
        query = @"insert into monan(ten, mota, nguyenlieu, cachnau, image, video, link) values(?, ?, ?, ?, ?, ?, ?)";
    }

    super.statement = [super getStatementFromQuery:query];
    if (super.statement) {
        sqlite3_bind_text(super.statement, 1, [monAn._ten UTF8String], -1, NULL);
        sqlite3_bind_text(super.statement, 2, [monAn._mota UTF8String], -1, NULL);
        sqlite3_bind_text(super.statement, 3, [monAn._nguyenlieu UTF8String], -1, NULL);
        sqlite3_bind_text(super.statement, 4, [monAn._cachnau UTF8String], -1, NULL);
        sqlite3_bind_text(super.statement, 5, [monAn._image UTF8String], -1, NULL);
        sqlite3_bind_text(super.statement, 6, [monAn._video UTF8String], -1, NULL);
        sqlite3_bind_text(super.statement, 7, [monAn._link UTF8String], -1, NULL);
        if (sqlite3_step(super.statement) == SQLITE_DONE) {
            result = YES;
        }
    }
    
    //Giai phong statement
    sqlite3_finalize(super.statement);
    return  result;
}

-(BOOL)deleteMonAn: (MonAn *) monAn{
    BOOL result = NO;
    NSString *query = [NSString stringWithFormat:@"delete from monan where id=%ld", monAn._id];
    super.statement = [super getStatementFromQuery:query];
    if (super.statement && sqlite3_step(super.statement) == SQLITE_DONE) {
        result = YES;
    }
    
    //Giai phong statement
    sqlite3_finalize(super.statement);
    return result;
}
@end
