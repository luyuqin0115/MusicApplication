// 跳转页面入口函数
@Builder
export function LayoutBuilder() {
  Layout();
}

interface TabClass {
  text: string
  icon: ResourceStr
}
@ComponentV2
struct Layout {
  @Local currentIndex:number = 0;
  //控制跳转对象
  pathStack: NavPathStack = new NavPathStack();

  tabData: TabClass[] = [
    {text: '推荐', icon: $r('app.media.ic_recommend')},
    {text: '发现', icon: $r('app.media.ic_find')},
    {text: '动态', icon: $r('app.media.ic_moment')},
    {text: '我的', icon: $r('app.media.ic_mine')}
  ]

  @Builder
  tabBuilder(item:TabClass,index:number){//自定义构建函数
    Column({space:5}){
      Image(item.icon)
        .width(24)
        .fillColor("#63AAAA")
      Text(item.text)
        .fontSize(14)
        .fontColor("#63AAAA")
    }
    .justifyContent(FlexAlign.Center)
  }

  build() {
    NavDestination() {
      Tabs({barPosition:BarPosition.End}){
        ForEach(this.tabData,(item:TabClass,index:number)=>{
          TabContent(){
            Text("内容")
          }
          .tabBar(this.tabBuilder(item,index))
          .backgroundColor("#131215")
          .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
        })
      }
      .backgroundColor("#3B3F42")
      .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
    }
    // .title('layoutUI')
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}