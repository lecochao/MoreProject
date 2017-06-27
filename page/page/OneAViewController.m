//
//  OneAViewController.m
//  打包.a文件
//
//  Created by lecochao on 2017/6/16.
//  Copyright © 2017年 lecochao. All rights reserved.
//

#import "OneAViewController.h"
#import "Person.h"
@interface OneAViewController ()

@end

@implementation OneAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // image 所在位置..page->Oneicon.xcassets
    _img.image = [UIImage imageNamed:@"pageSource.bundle/image"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)show:(id)sender {
    
    Person *pp = [Person getNewPerson];
    _lblName.text = pp.name;
    _lblPhone.text = pp.phone;
    _lblAdress.text = pp.address;
    _img.image = pp.portrait;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
