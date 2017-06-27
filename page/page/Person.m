//
//  Person.m
//  打包.a文件
//
//  Created by lecochao on 2017/6/16.
//  Copyright © 2017年 lecochao. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (Person *)getNewPerson
{
    NSArray *names = @[@"张三",@"李四",@"王麻子"];
    NSArray *phones = @[@"131222222",@"1313333333",@"13144444444"];
    NSArray *imgs = @[@"Source.bundle/head_icon_1",@"Source.bundle/head_icon_2",@"Source.bundle/head_icon_2"];
    Person *pp = [[Person alloc] init];
    NSInteger nn = arc4random()%3;
    pp.name = names[nn];
    pp.phone = phones[nn];
    pp.address = [NSString stringWithFormat:@"%@ 的地址。。。。",names[nn]];
    
    pp.portrait = [UIImage imageNamed:imgs[nn]];
    return pp;
}

@end
