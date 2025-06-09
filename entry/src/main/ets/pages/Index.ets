import { AppStorageV2 } from '@kit.ArkUI';

@Entry
@Component
struct Index {
  // pathStack : NavPathStack = new NavPathStack();
  pathStack : NavPathStack = AppStorageV2.connect(NavPathStack,"navPathStack",()=>new NavPathStack())!;

  build() {
    Navigation(this.pathStack){
    }.onAppear(() => {
      this.pathStack.pushPathByName("Start", null, false);
    })
    .hideNavBar(true)
  }
}