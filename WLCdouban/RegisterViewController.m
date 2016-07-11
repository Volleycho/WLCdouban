//
//  RegisterViewController.m
//  WLCdouban
//
//  Created by lanou3g on 16/6/29.
//  Copyright © 2016年 wanglichao. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterRequest.h"

@interface RegisterViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *avatorImageV;

@property (weak, nonatomic) IBOutlet UITextField *usernameTF;

@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@property(nonatomic,strong) UIImagePickerController *imagePickerController;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.avatorImageV.userInteractionEnabled = YES;
    UITapGestureRecognizer * recognize = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(addImage)];
    [self.avatorImageV addGestureRecognizer:recognize];
    
}
-(void)addImage{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc]init];
    pickerController.delegate = self;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"本地相册" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:pickerController animated:YES completion:nil];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [self presentViewController:alert animated:YES completion:nil];
    [alert addAction:action1];
    [alert addAction:action2];
//    pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//    [self presentViewController:pickerController animated:YES completion:^{
//        
//    }];
}

//图片点击事件
- (void)addDevies
{
    //创建UIAlertController是为了让用户去选择照片来源,拍照或者相册.
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:0];
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"从相册选取" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        
        [self presentViewController:imagePickerController animated:YES completion:^{}];
    }];
    
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"拍照" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        
        imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:imagePickerController animated:YES completion:^{}];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action)
                                   {
                                       //这里可以不写代码
                                   }];
    [self presentViewController:alertController animated:YES completion:nil];
    
    //用来判断来源 Xcode中的模拟器是没有拍摄功能的,当用模拟器的时候我们不需要把拍照功能加速
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
        
    {
        
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        [alertController addAction:photoAction];
        
    }
    
    else
    {
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
    }
    
}

//这个是选取完照片后要执行的代理方法
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
//{
//    [picker dismissViewControllerAnimated:YES completion:^{}];
//    //选取裁剪后的图片
//    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
//    /* 此处info 有六个值
//     * UIImagePickerControllerMediaType; // an NSString UTTypeImage)
//     * UIImagePickerControllerOriginalImage;  // a UIImage 原始图片
//     * UIImagePickerControllerEditedImage;    // a UIImage 裁剪后图片
//     * UIImagePickerControllerCropRect;       // an NSValue (CGRect)
//     * UIImagePickerControllerMediaURL;       // an NSURL
//     * UIImagePickerControllerReferenceURL    // an NSURL that references an asset in the AssetsLibrary framework
//     * UIImagePickerControllerMediaMetadata    // an NSDictionary containing metadata from a captured photo
//     */
//    _avatorImageV.image = image;
//}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.avatorImageV.image = image;
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}


//注册
- (IBAction)RegisterAction:(id)sender {
    
    RegisterRequest *request = [[RegisterRequest alloc]init];
    
    [request registerRequestWithUsername:self.usernameTF.text password:self.passwordTF.text avator:self.avatorImageV.image success:^(NSDictionary *dic) {
        
        NSLog(@"register success = %@",dic);
        
        
        NSString *code = [[dic objectForKey:@"code"] stringValue];
        if ([code isEqualToString:@"1005"]) {
            NSString *avatar = [[dic objectForKey:@"data"] objectForKey:@"avatar"];
            NSString *userId = [[dic objectForKey:@"data"] objectForKey:@"userId"];
            //保存头像和id到本地
            [[NSUserDefaults standardUserDefaults] setObject:avatar forKey:@"avatar"];
            [[NSUserDefaults standardUserDefaults] setObject:userId forKey:@"userId"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        
    } failure:^(NSError *error) {
        NSLog(@"register failure = %@",error);
    }];
    
    //注册完成后返回个人中心
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
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
