@Component
export struct Mine {
  build() {
    Column() {
      // 上部分：图片区域 - 占70%高度
      Stack() {
        // 背景图片网格
        Column() {
          // 第一行专辑封面
          Row() {
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
          }
          .width('100%')

          // 第二行专辑封面
          Row() {
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
          }
          .width('100%')

          // 第三行专辑封面
          Row() {
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
          }
          .width('100%')

          // 第四行专辑封面
          Row() {
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
            Image('http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.jpg')
              .width('25%')
              .aspectRatio(1)
              .objectFit(ImageFit.Cover)
          }
          .width('100%')
        }
        .width('100%')
        .height('100%')
        .opacity(0.6)

        // Logo - 位于底部居中
        Text("♪")
          .fontSize(60)
          .fontColor("#fff")
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .height('70%')
      .alignContent(Alignment.BottomCenter)
      .backgroundColor("#000")

      // 下部分：介绍区域 - 占30%高度
      Column({ space: 16 }) {
        // 第一行：软件名字
        Text("泡泡云音乐")
          .fontSize(24)
          .fontColor("#fff")
          .fontWeight(FontWeight.Bold)
          .margin({ top: 20 })

        // 第二行：用户基本信息
        Column({ space: 8 }) {
          Text("手机用户_845")
            .fontSize(16)
            .fontColor("#fff")
          
          Text("个性签名：分享你我的音乐故事")
            .fontSize(14)
            .fontColor("#999")
        }
        .alignItems(HorizontalAlign.Center)

        // 第三行：账户信息
        Row({ space: 40 }) {
          Column({ space: 4 }) {
            Text("86")
              .fontSize(18)
              .fontColor("#fff")
              .fontWeight(FontWeight.Bold)
            Text("关注")
              .fontSize(12)
              .fontColor("#999")
          }
          .alignItems(HorizontalAlign.Center)

          Column({ space: 4 }) {
            Text("8645")
              .fontSize(18)
              .fontColor("#fff")
              .fontWeight(FontWeight.Bold)
            Text("粉丝")
              .fontSize(12)
              .fontColor("#999")
          }
          .alignItems(HorizontalAlign.Center)

          Column({ space: 4 }) {
            Text("获赞")
              .fontSize(12)
              .fontColor("#999")
            Text("8万")
              .fontSize(18)
              .fontColor("#fff")
              .fontWeight(FontWeight.Bold)
          }
          .alignItems(HorizontalAlign.Center)
        }
        .justifyContent(FlexAlign.Center)
        .width('100%')
      }
      .width('100%')
      .height('30%')
      .backgroundColor("#000")
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Start)
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#000")
  }
}