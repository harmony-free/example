import { global, router } from "@free/global";
import { PageFace, RefreshList, RefreshUtils } from "@free/refresh";
import "./systemicon/SystemIcon"

interface IconFace{
  title: string
  icon: Resource
  router: string
}

export class IconModel implements IconFace {
  title: string
  router: string;
  icon: Resource
  constructor(icon:IconFace) {
    this.icon = icon.icon
    this.title = icon.title
    this.router = icon.router
  }
}

@Component
export struct OwnerContent{

  dataSource:Array<IconModel> = [
    new IconModel({icon:$r('sys.media.clone_app_badge_1'),title:"系统图标",router:"systemIcon"}),
    new IconModel({icon:$r('sys.media.clone_app_badge_2'),title:"图标",router:"systemIcon"}),
    new IconModel({icon:$r('sys.media.clone_app_badge_3'),title:"图标",router:"systemIcon"}),
    new IconModel({icon:$r('sys.media.clone_app_badge_4'),title:"图标",router:"systemIcon"}),
    new IconModel({icon:$r('sys.media.clone_app_badge_5'),title:"设置",router:"systemIcon"}),
  ]


  @Builder
  itemBuilder(data:object,index:number){
    Row(){
      Image((data as IconModel).icon).width(30)
      Text((data as IconModel).title).margin({left:10}).flexGrow(1)
      Image($r('sys.media.ohos_ic_public_arrow_right')).width(30).aspectRatio(1)
    }
    .width('100%')
    .padding(10)
    .backgroundColor(Color.White)
    .onClick(()=>{
      router.push((data as IconModel).router)
    })
  }
  @Builder
  headerBuilder(){
    Row(){
      Image($r('sys.media.huawei_id_logo_red')).width(100).height(100).borderRadius(50)
      Column(){
        Text("姓名").fontSize(20).fontColor(Color.Black)
        Text("账号：12326516712")
      }.flexGrow(1).alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.SpaceEvenly).margin(10).height(100)
      Image($r('sys.media.ohos_ic_public_arrow_right')).width(30)
    }
    .width('100%')
    .height(200)
    .padding({top:global.getNavBarHeight(),left:10,right:10,bottom:20})
    .margin({bottom:10}).backgroundColor(Color.White)
    .onClick(()=>{
      if (global.storage.get("token", "") == "") {

      }
    })
  }

  /**
   * 刷新
   */
  upData = (page?: PageFace):Promise<boolean | Array<object>> => {
    return new Promise<boolean | Array<object>>((res, rej) => {
      let list:IconModel[] = []
      this.dataSource.forEach((e)=>{
        list.push(new IconModel(e))
      })
      res(list)
    })
  }

  build() {
    RefreshList({
      headerBuilderParam:this.headerBuilder,
      itemBuilderParam:this.itemBuilder,
      refresh:new RefreshUtils({data:this.dataSource})
    }).height(global.getContentNavBar()).backgroundColor("#EEEEEE")
  }
}