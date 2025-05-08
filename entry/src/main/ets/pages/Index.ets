import { global, PreferencesSystem } from '@free/global';
import { router } from '@kit.ArkUI';


@Entry
@Component
struct Index {

  @State time:number = 3
  timeoutID:number = 0

  toRoot(){
    let launch = new PreferencesSystem().get("launch",false)
    if (launch) {
      router.replaceUrl({url:"pages/RootIndex"})
    }else{
      new PreferencesSystem().putFlush("launch",true);
      this.timeoutID = setInterval(()=>{
        this.time -= 1;
        if (this.time<=0) {
          this.back()
        }
      }, 1000)
    }
  }



  aboutToAppear(): void {
    this.toRoot()
  }

  back(url?:string){
    clearInterval(this.timeoutID);
    router.replaceUrl({url:"pages/RootIndex",params:{url:url}});
  }

  build() {
    Stack(){
      Image($r('app.media.background')).width(global.width).height(global.height).onClick(()=>{
        this.back("https://www.baidu.com");
      })
      Button(`跳过${this.time}`).backgroundColor(0x30000000).onClick(()=>this.back()).position({right:20,top:global.top + 20})
    }
  }
}