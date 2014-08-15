//
//  UIViewController+ShareToWeChat.m
//  WeChatDemo
//
//  Created by Mac on 14-7-24.
//  Copyright (c) 2014年 Mac. All rights reserved.
//

#import "UIViewController+ShareToWeChat.h"

@implementation UIViewController (ShareToWeChat)

+(void)shareToWeChatWithTitle:(NSString *)title Description:(NSString *)description Image:(UIImage *) URLStr:(NSString *)url{
    WXMediaMessage *message = [WXMediaMessage message];
//    [message setThumbImage:[UIImage imageNamed:@"icon.png" ]];
    message.title = title;
    message.description = description;
    
    WXAppExtendObject *ext = [WXAppExtendObject object];
    ext.url = url;
    
    message.mediaObject = ext;
    
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc]init];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneTimeline;
    
    [WXApi sendReq:req];
}

-(void)shareToWeChatWithTitle:(NSString *)title Description:(NSString *)description LinkURL:(NSString *)linkURL{
    
}
@end
