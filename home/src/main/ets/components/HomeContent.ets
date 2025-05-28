import { global, NavBar, router } from "@free/global"
import { Location } from "@free/location"
import { PageFace, RefreshList, RefreshModel, RefreshUtils } from "@free/refresh"
import { normalView, refreshView } from "@free/refresh/src/main/ets/components/RefreshBuilder"
import { geoLocationManager } from "@kit.LocationKit"
import './AddressPage'
import { print } from "@kit.BasicServicesKit"
import { JSON } from "@kit.ArkTS"

@Component
export struct HomeContent{

  @State address:geoLocationManager.GeoAddress = {}

  private local:Location = new Location()

  aboutToAppear(): void {
    this.getLocation()
  }

  getLocation(){
    global.permissions("ohos.permission.LOCATION","ohos.permission.APPROXIMATELY_LOCATION").then((p)=>{
      if (p == true) {
        this.local.location().then((v)=>{
          this.address = v;
        })
      }
    })
  }


  @Builder
  itemBuilder(model:object,index:number){
    Text((model as RefreshModel).title).onClick(()=>{

    })
  }
  @Builder
  headerBuilder(){
    Text('header').padding(20)
  }
  @Builder
  footerBuilder(){
    Text('footer').padding(20)
  }


  upData(page?: PageFace | undefined): Promise<boolean | Array<RefreshModel>> {
    return new Promise<boolean | Array<RefreshModel>>((res, rej) => {
      setTimeout(() => {
        res([new RefreshModel()])
      }, 2000)
    })
  }

  downData(page?: PageFace | undefined): Promise<boolean | Array<RefreshModel>> {
    return new Promise<boolean | Array<RefreshModel>>((res, rej) => {
      setTimeout(() => {
        res([new RefreshModel])
      }, 2000)
    })
  }

  @Builder
  leftBuilder(){
    Row(){
      Image($r("sys.media.ohos_ic_public_location"))
        .width(13).aspectRatio(1);
      Text(this.address.placeName ?? "定位中" )
        .width(50)
        .maxLines(1)
        .fontSize(10)
        .textOverflow({ overflow: TextOverflow.MARQUEE })
      Image($r("sys.media.ohos_ic_public_arrow_right"))
        .width(13).aspectRatio(1);
    }.padding({left:5}).onClick(()=>{
      if (this.address == undefined){
        this.getLocation()
      }else {
        router.push("address",this.address).then((data)=>{
          if (data.data!=undefined) {
            this.address = data.data as geoLocationManager.GeoAddress;
          }
        })
      }
    })
  }

  build() {
    Column(){
      NavBar({title:"首页",leftBuilderParam: this.leftBuilder.bind(this)})
      RefreshList({
        headerBuilderParam:this.headerBuilder,
        footerBuilderParam:this.footerBuilder,
        cachedCount:5,
        refresh:new RefreshUtils({upData:this.upData.bind(this),downData:this.downData.bind(this),data:[new RefreshModel]}),
        itemBuilderParam:this.itemBuilder,
      }).height(global.getContentHeight())
    }
  }
}