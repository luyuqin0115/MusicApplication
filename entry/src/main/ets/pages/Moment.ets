// 定义歌曲数据类型
interface songItemType {
  img: string
  name: string
  author: string
  url: string
  id: string
}

// 定义动态数据类型
interface momentListType {
  author: string
  avatar: string
  content: string
  comment: number
  like: number
  song: songItemType
}

@Component
export struct Moment {
  // 歌曲数据
  songs: songItemType[] = [
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.jpg',
      name: '直到世界的尽头',
      author: 'WANDS',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/0.m4a',
      id: '0000'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.jpg',
      name: '画',
      author: '赵磊',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/1.mp3',
      id: '0001'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.jpg',
      name: 'Sweet Dreams',
      author: 'TPaul Sax / Eurythmics',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/2.mp3',
      id: '0002'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.jpg',
      name: '奢香夫人',
      author: '凤凰传奇',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/3.m4a',
      id: '0003'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.jpg',
      name: '空心',
      author: '光泽',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/4.mp3',
      id: '0004'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.jpg',
      name: '反转地球',
      author: '潘玮柏',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/5.mp3',
      id: '0005'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.jpg',
      name: 'No.9',
      author: 'T-ara',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/6.m4a',
      id: '0006'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.jpg',
      name: '孤独',
      author: 'G.E.M.邓紫棋',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/7.m4a',
      id: '0007'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.jpg',
      name: 'Lose Control',
      author: 'Hedley',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/8.m4a',
      id: '0008'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.jpg',
      name: '倩女幽魂',
      author: '张国荣',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/9.m4a',
      id: '0009'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.jpg',
      name: '北京北京',
      author: '汪峰',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/10.m4a',
      id: '0010'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.jpg',
      name: '苦笑',
      author: '汪苏泷',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/11.mp3',
      id: '0011'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.jpg',
      name: '一生所爱',
      author: '卢冠廷 / 莫文蔚',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/12.m4a',
      id: '0012'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.jpg',
      name: '月半小夜曲',
      author: '李克勤',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/13.mp3',
      id: '0013'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.jpg',
      name: 'Rolling in the Deep',
      author: 'Adele',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/14.m4a',
      id: '0014'
    },
    {
      img: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.jpg',
      name: '海阔天空',
      author: 'Beyond',
      url: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/15.m4a',
      id: '0015'
    }
  ]

  // 动态数据
  momentList: momentListType[] = [
    {
      author: 'Feast-aws',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h0.jpg',
      content: '二十几岁的你，一无所有，也拥有一切！',
      comment: 604,
      like: 23382,
      song: this.songs[0]
    },
    {
      author: 'CeeYet',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h1.jpg',
      content: '画一个姑娘陪着我,再画一个姑娘陪着我',
      comment: 1237,
      like: 5482,
      song: this.songs[1]
    },
    {
      author: 'Z_HOUSC',
      avatar: 'http://yjy-teach-oss.oss-cn-beijing.aliyuncs.com/HeimaCloudMusic/h2.jpg',
      content: '这个事还得从两个职业选手说起',
      comment: 8425,
      like: 4234,
      song: this.songs[2]
    }
  ]

  build() {
    Column() {
      // 标题
      Text("互动广场")
        .fontSize(18)
        .fontColor("#fff")
        .fontWeight(FontWeight.Bold)
        .padding({ top: 20, bottom: 20, left: 16, right: 16 })
        .width('100%')
        .textAlign(TextAlign.Start)

      // 动态列表
      List({ space: 16 }) {
        ForEach(this.momentList, (moment: momentListType) => {
          ListItem() {
            Column() {
              // 用户信息和内容 - 水平布局，头像顶部对齐
              Row({ space: 12 }) {
                // 用户头像
                Image(moment.avatar)
                  .width(40)
                  .height(40)
                  .borderRadius(20)
                  .objectFit(ImageFit.Cover)

                // 用户名和内容
                Column({ space: 6 }) {
                  Text(moment.author)
                    .fontSize(14)
                    .fontColor("#fff")
                    .fontWeight(FontWeight.Medium)
                    .alignSelf(ItemAlign.Start)

                  Text(moment.content)
                    .fontSize(14)
                    .fontColor("#aaa")
                    .lineHeight(20)
                    .alignSelf(ItemAlign.Start)
                }
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1)
              }
              .alignItems(VerticalAlign.Top)
              .width('100%')

              // 歌曲信息卡片
              Row({ space: 12 }) {
                Image(moment.song.img)
                  .width(40)
                  .height(40)
                  .borderRadius(4)
                  .objectFit(ImageFit.Cover)

                Column({ space: 4 }) {
                  Text(moment.song.name)
                    .fontSize(14)
                    .fontColor("#fff")
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .alignSelf(ItemAlign.Start)

                  Text(moment.song.author)
                    .fontSize(12)
                    .fontColor("#888")
                    .maxLines(1)
                    .textOverflow({ overflow: TextOverflow.Ellipsis })
                    .alignSelf(ItemAlign.Start)
                }
                .alignItems(HorizontalAlign.Start)
                .layoutWeight(1)

                // 播放按钮
                Text("▶")
                  .fontSize(16)
                  .fontColor("#fff")
              }
              .width('100%')
              .padding(12)
              .backgroundColor("rgba(255, 255, 255, 0.1)")
              .borderRadius(8)
              .margin({ top: 12, left: 52 })

              // 互动按钮
              Row({ space: 24 }) {
                // 分享
                Row({ space: 4 }) {
                  Image($r("app.media.ic_share"))
                    .width(16)
                    .height(16)
                    .fillColor("#888")
                  Text("分享")
                    .fontSize(12)
                    .fontColor("#888")
                }

                // 评论
                Row({ space: 4 }) {
                  Image($r("app.media.ic_comment_o"))
                    .width(16)
                    .height(16)
                    .fillColor("#888")
                  Text(moment.comment.toString())
                    .fontSize(12)
                    .fontColor("#888")
                }

                // 点赞
                Row({ space: 4 }) {
                  Image($r("app.media.ic_like"))
                    .width(16)
                    .height(16)
                    .fillColor("#888")
                  Text(moment.like.toString())
                    .fontSize(12)
                    .fontColor("#888")
                }

                Blank()
              }
              .width('100%')
              .margin({ top: 12, left: 52 })
            }
            .alignItems(HorizontalAlign.Start)
            .width('100%')
            .padding({ left: 16, right: 16, top: 12, bottom: 12 })
          }
        })
      }
      .layoutWeight(1)
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
    .backgroundColor("#000")
  }
}