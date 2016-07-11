//
//  MovieViewController.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/28.
//  Copyright © 2016年 wanglichao. All rights reserved.
//



#import "MovieViewController.h"
#import "MovieRequest.h"
#import "MovieModel.h"
#import "MovieTableViewCell.h"
#import "MovieDetailViewController.h"

                                  
@interface MovieViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *movietableview;

@property(nonatomic,strong) NSMutableArray *movieArray;

@end

@implementation MovieViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [LBProgressHUD showHUDto:self.view animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //注册
    [self.movietableview registerNib:[UINib nibWithNibName:@"MovieTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:MovieTableViewCell_Identify];
    
    
    
    self.movieArray = [NSMutableArray array];
    MovieRequest *request = [[MovieRequest alloc]init];
    [request MovieRequestWithparameter:nil success:^(NSDictionary *dic) {
//        NSLog(@"%@",dic);
        
        for (NSDictionary *tempdic in dic[@"entries"]) {
            MovieModel *model = [MovieModel new];
            [model setValuesForKeysWithDictionary:tempdic];
            
            
            
            [self.movieArray addObject:model];
            
            [self.movietableview reloadData];
//            NSLog(@"%@",self.movieArray);
        }
        
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
 
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

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 160;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.movieArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MovieTableViewCell_Identify];

    MovieModel *model = self.movieArray[indexPath.row];
    
    [cell setMovieMdel:model];


    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    MovieModel *model = self.movieArray[indexPath.row];
    [self performSegueWithIdentifier:@"MovieDetailViewController" sender:model];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"MovieDetailViewController"]) {
        MovieDetailViewController *movieDV = segue.destinationViewController;
        movieDV.model = sender;
        
    }
    
    
}


@end
