//
//  TheatrMapViewController.m
//  WLCdouban
//
//  Created by lanou3g on 16/7/1.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "TheatrMapViewController.h"
//显示地图
#import <BaiduMapAPI_Map/BMKMapComponent.h>

//地图编码（根据位置信息检索）
#import <BaiduMapAPI_Search/BMKSearchComponent.h>


@interface TheatrMapViewController ()<BMKGeoCodeSearchDelegate,BMKMapViewDelegate>

//地图view属性
@property(nonatomic,strong) BMKMapView *mapview;

//用来实现搜索
//编码搜索对象
@property(nonatomic,strong) BMKGeoCodeSearch *geocodeSearch;


@end

@implementation TheatrMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _mapview = [[BMKMapView alloc]initWithFrame:CGRectMake(0, 0, WindownWidth, WindowHeight)];
    // 地图比例尺级别，在手机上当前可使用的级别为3-21级
    _mapview.zoomLevel = 17;
    
    self.view = _mapview;
    
    //创建检索工具
    _geocodeSearch  = [[BMKGeoCodeSearch alloc]init];
    _geocodeSearch.delegate = self;
    
    //创建检索信息类对象
    BMKGeoCodeSearchOption *option = [[BMKGeoCodeSearchOption alloc]init];
    option.city = @"北京市";
    option.address = @"金五星商厦";
    
//    option.address = _model.address;
    BOOL isSucc = [_geocodeSearch geoCode:option];
    if (isSucc) {
        NSLog(@"检索成功");
    }
    else
    {
        NSLog(@"检索失败");
    }
    
}

//编码的代理方法
-(void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    NSLog(@"search result = %@",result);
    
    //把上一次显示的大头针的数据清空
    NSArray *arr = [NSArray arrayWithArray:_mapview.annotations];
    [_mapview removeAnnotations:arr];
    
    //大头针
    BMKPointAnnotation *pointAnnotation = [[BMKPointAnnotation alloc]init];
    //设置经纬度
    pointAnnotation.coordinate = result.location;
    pointAnnotation.title = result.address;
    NSLog(@"result = %@",result);
    [_mapview addAnnotation:pointAnnotation];
    //设置当前地点为地图的中心点
    _mapview.centerCoordinate = result.location;
    
}

-(BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id<BMKAnnotation>)annotation
{
    //当做大头针视图的标识符
    NSString *annotationViewID = @"annotationID";
    //根据标识符,查找一个可以复用的大头针
    BMKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:annotationViewID];
    //如果没有可复用的大头针,就创建一个新的大头针,并加上标识符
    //BMKPinAnnotationView 是BMKAnnotationView子类,添加了颜色以及一个动画效果
    if (annotationView == nil) {
        annotationView = [[BMKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:annotationViewID];
        //下面两个是设置效果
        //设置颜色
        ((BMKPinAnnotationView *)annotationView).pinColor = BMKPinAnnotationColorRed;
        //设置动画效果(从天而降的动画效果)
        //        ((BMKPinAnnotationView *)annotationView).animatesDrop = YES;
    }
    
    annotationView.annotation = annotation;
    //设可以点击大头针弹出信息
    //    annotationView.canShowCallout = YES;
    return annotationView;

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [LBProgressHUD showHUDto:self.view animated:YES];
    
    [super viewWillAppear:animated];
    [_mapview viewWillAppear];
    //设置代理
    _mapview.delegate = self;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_mapview viewWillDisappear];
    //当不适用地图的时候,把代理设置为 nil
    _mapview.delegate = nil;
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [LBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
