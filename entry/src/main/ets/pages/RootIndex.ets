import { global, router, routerMap} from '@free/global';
import { image } from '@kit.ImageKit';
import { HomeContent } from 'home';
import { ActivityContent } from './ActivityContent';
import { FoundContent } from './FoundContent';
import { OwnerContent } from './OwnerContent';
import { router as route } from '@kit.ArkUI';
import { LOGIN_INDEX } from 'common';


export  interface TabBarFace{
  title:string,
  icon: image.PixelMap | ResourceStr | DrawableDescriptor,
  selectIcon: image.PixelMap | ResourceStr | DrawableDescriptor,
  router:string
}

@Entry
@Component
struct RootIndex {
  @State selectIndex: number = 0;
  @State tabs:Array<TabBarFace> = [
    {title:"首页",selectIcon:$r('sys.media.ohos_ic_public_device_phone'),icon:$r('sys.media.ohos_ic_public_device_phone'),router:"home"},
    {title:"活动",selectIcon:$r('sys.media.ohos_ic_public_clock'),icon:$r('sys.media.ohos_ic_public_clock'),router:"activity"},
    {title:"发现",selectIcon:$r('sys.media.ohos_ic_public_device_matebook'),icon:$r('sys.media.ohos_ic_public_device_matebook'),router:"found"},
    {title:"我的",selectIcon:$r('sys.media.ohos_user_auth_icon_face'),icon:$r('sys.media.ohos_user_auth_icon_face'),router:"owner"},
  ];

  onBackPress(): boolean | void {
    return true
  }

  aboutToAppear(): void {
    if (global.getParams('url') != undefined){
      setTimeout(()=>{
        router.push('web')
      },100)
    }
    if (global.storage.get('token', "") == "") {
      setTimeout(()=>{
        route.pushUrl({url:LOGIN_INDEX})
      },100)
    }
  }


  @Builder
  tabBarView(item: TabBarFace,index: number){
    Column(){
      Image(this.selectIndex == index ? item.selectIcon : item.icon).width(22).aspectRatio(1).margin({bottom:3}).fillColor(this.selectIndex == index ? Color.Blue : Color.Gray)
      Text(item.title).fontSize(13).fontColor(this.selectIndex == index ? Color.Blue : Color.Gray)
    }
    .width(50)
    .height(59)
    .justifyContent(FlexAlign.Center)
  }


  build() {
    Navigation(router.navPathStack){
      Tabs({barPosition:BarPosition.End,index:this.selectIndex}){
        ForEach(this.tabs,(item: TabBarFace, index: number)=>{
          TabContent(){
            if (item.router == "home") {
              HomeContent()
            }else if (item.router == "activity"){
              ActivityContent()
            }else if (item.router == "found"){
              FoundContent()
            }else if (item.router == "owner"){
              OwnerContent()
            }
          }.tabBar(this.tabBarView(item,index)).tabIndex(index)
        },(item: TabBarFace, index: number)=> item.title)
      }
      .padding({bottom:global.bottom})
      .onAnimationStart((i,ti,e)=>{
        this.selectIndex = ti
      })
    }
    .navDestination(routerMap)
    .hideToolBar(true)
    .mode(NavigationMode.Stack)
  }
}