// 跳转页面入口函数
@Builder
export function StartBuilder() {
  Start();
}


@Component
struct Start {
  //控制跳转对象
  pathStack: NavPathStack = new NavPathStack();

  aboutToAppear(): void {
    setTimeout(()=>{
      this.pathStack.replacePathByName("Layout",null,false);
    },3000)
  }

  build() {
    NavDestination() {
      Stack({
        alignContent:Alignment.TopEnd
      }){
        Image($r("app.media.ad"))
          .width("100%")
          .height("100%")
          .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])
        Button("跳过")
          .backgroundColor(Color.Grey)
          .margin(15)
          .onClick(()=>{
            this.pathStack.replacePathByName("Layout",null,false);
          })
      }
    }
    // .title('ads')
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack;
    })
  }
}