import { global, NavBar, router } from "@free/global"
import { Location } from "@free/location"
import { PageFace, RefreshList, RefreshModel, RefreshUtils } from "@free/refresh"
import { normalView, refreshView } from "@free/refresh/src/main/ets/components/RefreshBuilder"
import { geoLocationManager } from "@kit.LocationKit"

@Builder
export function addressBuilder(o:geoLocationManager.GeoAddress){
  NavDestination(){
    AddressPage({address:o})
  }.hideTitleBar(true)
}

router.requestBuilder('address',wrapBuilder(addressBuilder))

@Component
export struct AddressPage{

  address:geoLocationManager.GeoAddress | undefined

  private local:Location = new Location

  aboutToAppear(): void {
    console.log(JSON.stringify(this.address))
  }


  @Builder
  itemBuilder(model:object,index:number){
    Text((model as geoLocationManager.GeoAddress).placeName).onClick(()=>{
      router.back(model);
    })
  }
  @Builder
  headerBuilder(){
    Text(this.address?.placeName).padding(20).fontColor(Color.Red)
  }
  @Builder
  footerBuilder(){
    Text('footer').padding(20)
  }


  upData(page?: PageFace | undefined): Promise<boolean | Array<geoLocationManager.GeoAddress>> {
    return new Promise<boolean | Array<geoLocationManager.GeoAddress>>((res, rej) => {
      global.permissions("ohos.permission.LOCATION","ohos.permission.APPROXIMATELY_LOCATION").then((p)=>{
        if (p == true) {
          this.local.locationList().then((v)=>{
            res(v);
          })
        }
      })
    })
  }

  downData(page?: PageFace | undefined): Promise<boolean | Array<geoLocationManager.GeoAddress>> {
    return new Promise<boolean | Array<geoLocationManager.GeoAddress>>((res, rej) => {
      global.permissions("ohos.permission.LOCATION","ohos.permission.APPROXIMATELY_LOCATION").then((p)=>{
        if (p == true) {
          this.local.locationList().then((v)=>{
            res(v);
          })
        }
      })
    })
  }

  @Builder
  leftBuilder(){
    Row(){
      Image($r("sys.media.ohos_ic_public_location"))
        .width(13).aspectRatio(1);
      Text(this.address?.placeName).fontSize(10)
      Image($r("sys.media.ohos_ic_public_arrow_right"))
        .width(13).aspectRatio(1);
    }.padding({left:5}).onClick(()=>{
      router.push("address").then((data)=>{
        this.address = data.data as geoLocationManager.GeoAddress;
      })
    })
  }

  build() {
    Column(){
      NavBar({title:"选择地址"})
      RefreshList({
        headerBuilderParam:this.headerBuilder.bind(this),
        footerBuilderParam:this.footerBuilder.bind(this),
        cachedCount:5,
        refresh:new RefreshUtils<geoLocationManager.GeoAddress>({upData:this.upData.bind(this),downData:this.downData.bind(this)}),
        itemBuilderParam:this.itemBuilder,
      }).height(global.getContentTabBar())
    }
  }
}