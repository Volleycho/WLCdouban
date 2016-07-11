//
//  ViewController.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/27.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "ViewController.h"
#import "ActivityRequest.h"
#import "MovieRequest.h"
#import "TheatrRequest.h"
#import "ActivityDetailRequest.h"
#import "MovieDetailRequest.h"
#import "MovieModel.h"


#import "ActivityModel.h"


@interface ViewController ()

//所有活动
@property(nonatomic,strong) NSMutableArray *activities;
//所有电影
@property(nonatomic,strong) NSMutableArray *movies;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.activities = [NSMutableArray array];
    
    self.movies = [NSMutableArray array];
    
//    [self requestActivityData];
    [self requestMovieData];
//    [self requestTheatrData];
//    [self requestActivityDetailWith:@"25201739"];
//    [self requestMovieDetailWith:@"25662337"];
    
}

//电影详情
-(void)requestMovieDetailWith:(NSString *)ID
{
    MovieDetailRequest *request = [[MovieDetailRequest alloc]init];
    
    [request movieDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        NSLog(@"success = %@",dic);
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
    
}


//活动详情
-(void)requestActivityDetailWith:(NSString *)ID
{
    ActivityDetailRequest *request = [[ActivityDetailRequest alloc]init];
    [request activityDetailRequestWithParameter:@{@"id":ID} success:^(NSDictionary *dic) {
        NSLog(@"activity detail success = %@",dic);
    } failure:^(NSError *error) {
        NSLog(@"activity error = %@",error);
    }];
    
}

//影院
- (void)requestTheatrData
{
    TheatrRequest *theatr = [[TheatrRequest alloc]init];
    
    [theatr TheatrRequestWithparameter:nil success:^(NSDictionary *dic) {
        NSLog(@"success = %@",dic);
    } failure:^(NSError *error) {
        
        
        NSLog(@"error = %@",error);
    }];
    
}

//电影
- (void)requestMovieData
{
    __weak typeof(self) weakSelf = self;
    
     MovieRequest *movie = [[MovieRequest alloc]init];
    
    [movie MovieRequestWithparameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"success = %@",dic);
        
//        NSString *movieTitle = [dic objectForKey:@"title"];
        
        NSArray *tempMovies = [dic objectForKey:@"entries"];
        
        for (NSDictionary *tempDic in tempMovies) {
            MovieModel *model = [MovieModel new];
            
            [model setValuesForKeysWithDictionary:tempDic];
            [weakSelf.movies addObject:model];
        }
        NSLog(@"weakSelf.movies = %@",weakSelf.movies);
        
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
}

//活动
- (void)requestActivityData
{
    __weak typeof(self) weakSelf = self;
    
    ActivityRequest *activity = [[ActivityRequest alloc]init];
    
    [activity activityRequestWithparameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"success = %@",dic);
        
        NSArray *events = [dic objectForKey:@"events"];
        
//        NSLog(@"events = %@",events);
        
        for (NSDictionary *tempDic in events) {
            ActivityModel *model = [ActivityModel new];
            [model setValuesForKeysWithDictionary:tempDic];
            
            [weakSelf.activities addObject:model];
        }
        NSLog(@"weakSelf.activities = %@",weakSelf.activities);
        
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
