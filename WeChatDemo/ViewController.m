//
//  ViewController.m
//  WeChatDemo
//
//  Created by Mac on 14-7-24.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+ShareToWeChat.h"
#import "ShareToWeChatViewController.h"

#define DeviceHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<ShareToWeChatDeleate>{
    ShareToWeChatViewController *shareVC;
}

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnShareWeChatAction:(UIButton *)sender {
    /*
    if ([WXApi isWXAppInstalled] && [WXApi isWXAppSupportApi]) {
//        WXMediaMessage *message = [WXMediaMessage message];
//        message.title = @"微之商场";
//        message.description = @"有大优惠了！！！！！！";
//        
//        SendMessageToWXReq *req = [[SendMessageToWXReq alloc]init];
//        req.bText = YES;
//        req.message = message;
//        req.scene = WXSceneTimeline;
//        
//        [WXApi sendReq:req];
//        
//        SendMessageToWXReq *sendMessage = [[SendMessageToWXReq alloc] init];
//        sendMessage.text = @"微信分享！！！！！！！！！！！！大大大金凤凰SD卡加会心睁不开解放后撒饿哦ikdfjls";
//        sendMessage.bText = YES;
//        sendMessage.scene = WXSceneTimeline;
//        [WXApi sendReq:sendMessage];
        
        
//        WXMediaMessage *message = [WXMediaMessage message];
//        [message setThumbImage:[UIImage imageNamed:@"icon.png" ]];
//        message.title = @"智慧商场";
//        message.description = @"智慧商场分享测试！！！！！";
//        
//        WXAppExtendObject *ext = [WXAppExtendObject object];
//        ext.url = @"http://www.baidu.com";
//        
//        message.mediaObject = ext;
//        
//        SendMessageToWXReq *req = [[SendMessageToWXReq alloc]init];
//        req.bText = NO;
//        req.message = message;
//        req.scene = 1;
//        
//        [WXApi sendReq:req];
        
        
        [UIViewController shareToWeChatWithTitle:@"智慧商场" Description:nil Image:nil :@"http://www.baidu.com"];
    }
     */
    if (!shareVC) {
        shareVC = [[ShareToWeChatViewController alloc]initWithNibName:@"ShareToWeChatViewController" bundle:nil];
        shareVC.delegate = self;
        [self.view addSubview:shareVC.view];
        shareVC.view.frame = CGRectMake(0, DeviceHeight, 320, DeviceHeight);
//        shareVC.contontView.frame = CGRectMake(0, DeviceHeight, 320, 208);
    }
    [shareVC showView];
     
}


//微信分享
- (void)sendTextToWX:(NSString *)text{
    if (![WXApi isWXAppInstalled]) {
        return;
    }
    if (![WXApi isWXAppSupportApi]) {
        return;
    }
    SendMessageToWXReq *sendMessage = [[SendMessageToWXReq alloc] init];
    sendMessage.text = text;
    sendMessage.bText = YES;
    sendMessage.scene = WXSceneTimeline;
    [WXApi sendReq:sendMessage];
//    [sendMessage release];
}

- (void)sendImageToWX:(UIImage *)image text:(NSString *)text{
    if (![WXApi isWXAppInstalled]) {
        return;
    }
    if (![WXApi isWXAppSupportApi]) {
        return;
    }
    SendMessageToWXReq *sendMessage = [[SendMessageToWXReq alloc] init];
    //    sendMessage.bText = YES;
    sendMessage.text = text;
    sendMessage.scene = WXSceneTimeline;
    WXMediaMessage *mediaMessage = [WXMediaMessage message];
    WXImageObject *imageObject = [WXImageObject object];
    imageObject.imageData = UIImageJPEGRepresentation(image, 1.0);
    mediaMessage.mediaObject = imageObject;
    mediaMessage.title = text;
    sendMessage.message = mediaMessage;
    [WXApi sendReq:sendMessage];
//    [sendMessage release];
}

-(void)hiddenShareView:(UIViewController *)vc{
    [UIView animateWithDuration:0.3 animations:^(void){
        CGRect frame = vc.view.frame;
        frame.origin.y += DeviceHeight;
        vc.view.frame = frame;
    }];
}

@end
