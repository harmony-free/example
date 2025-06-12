import { global, NavBar, router } from "@free/global"
import { Location } from "@free/location"
import { BaseMap } from "@free/map"
import { PageFace, RefreshList, RefreshUtils } from "@free/refresh"
import { geoLocationManager } from "@kit.LocationKit"
import './MapPage'
import { mapCommon } from "@kit.MapKit"

@Builder
export function addressBuilder(o:geoLocationManager.GeoAddress){
  NavDestination(){
    AddressPage({address:o})
  }.hideTitleBar(true)
}

router.requestBuilder('address',wrapBuilder(addressBuilder))

@Component
export struct AddressPage{

  @State address:geoLocationManager.GeoAddress = {}

  private local:Location = new Location

  aboutToAppear(): void {
    console.log(JSON.stringify(this.address))
  }

  getLocation(){
    global.permissions("ohos.permission.LOCATION","ohos.permission.APPROXIMATELY_LOCATION").then((p)=>{
      if (p == true) {
        this.local.location().then((v)=>{
          this.address = v;
          let latLng = this.local.toGCJ02(this.address as mapCommon.LatLng)
          this.address.latitude = latLng.latitude
          this.address.longitude = latLng.longitude
        })
      }
    })
  }


  @Builder
  itemBuilder(model:object,index:number){
    Column(){
      Text((model as geoLocationManager.GeoAddress).placeName).onClick(()=>{
        router.back(model);
      })
    }.width('100%').padding(15).alignItems(HorizontalAlign.Start).backgroundColor(Color.White)
  }

  @Builder
  headerBuilder(){
    Column(){
      Text("当前选择").fontSize(12).fontColor('#FFCCCCCC')
      Row(){
        Text(this.address?.placeName).width('75%').fontColor(Color.Black).fontWeight(FontWeight.Medium).fontSize(14)
        Text("重新定位").fontColor(Color.Blue).fontSize(14).onClick(()=>{
          this.getLocation()
        })
      }.margin({top:10}).justifyContent(FlexAlign.SpaceBetween).width("100%")
    }.padding(15).alignItems(HorizontalAlign.Start).backgroundColor(Color.White).margin({bottom:10})
  }

  @Builder
  footerBuilder(){
    Text('导航').padding(20).onClick(()=>{

    })
  }


  upData(page?: PageFace | undefined): Promise<boolean | Array<geoLocationManager.GeoAddress>> {
    return new Promise<boolean | Array<geoLocationManager.GeoAddress>>((res, rej) => {
      global.permissions("ohos.permission.LOCATION","ohos.permission.APPROXIMATELY_LOCATION").then((p)=>{
        if (p == true) {
          this.local.locationList().then((v)=>{
            v.forEach((l)=>{
              let latLng = this.local.toGCJ02(l as mapCommon.LatLng)
              l.latitude = latLng.latitude
              l.longitude = latLng.longitude
            })
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
  rightBuilder(){
    Text("地图选点").onClick(()=>{
      BaseMap.chooseLocation(this.address as mapCommon.LatLng).then((v)=>{
        this.address.placeName = v.name;
        this.address.latitude = v.location.latitude;
        this.address.longitude = v.location.longitude;
      })
    })
  }

  build() {
    Column(){
      NavBar({title:"选择地址",rightBuilderParam:this.rightBuilder.bind(this),backAction:()=>{
        router.pop(this.address);
      }})
      RefreshList({
        color: '#FFEEEEEE',
        headerBuilderParam:this.headerBuilder.bind(this),
        footerBuilderParam:this.footerBuilder.bind(this),
        cachedCount:5,
        refresh:new RefreshUtils<geoLocationManager.GeoAddress>({upData:this.upData.bind(this),downData:this.downData.bind(this)}),
        itemBuilderParam:this.itemBuilder,
      }).height(global.getContentTabBar())
    }
  }
}