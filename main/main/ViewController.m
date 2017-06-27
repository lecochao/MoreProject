//
//  ViewController.m
//  MoreProject
//
//  Created by lecochao on 2017/6/26.
//  Copyright © 2017年 lecochao. All rights reserved.
//

#import "ViewController.h"
#import <OneAViewController.h>
#import <Person.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *img = [UIImage imageNamed:@"dundle.bundle/QQ20170623-143742.png"];
    Person *pp = [Person getNewPerson];
    NSLog(@"%@ - %@ - %@",pp.name,pp.phone,NSStringFromCGSize(pp.portrait.size));
}

- (IBAction)push:(id)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Source" ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"XcOne" bundle:bundle];
    OneAViewController *onevc = [sb instantiateViewControllerWithIdentifier:@"OneAViewController"];
    [self.navigationController pushViewController:onevc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
