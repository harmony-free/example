import { global, NavBar, router } from "@free/global"
import { map, mapCommon, MapComponent } from "@kit.MapKit";
import { AsyncCallback } from "@kit.BasicServicesKit";
import { geoLocationManager } from "@kit.LocationKit";
import { Location } from "@free/location";
import { MarkerMap } from "@free/map";

@Builder
export function mapBuilder(o:geoLocationManager.GeoAddress){
  NavDestination(){
    MapPage({address:o})
  }.hideTitleBar(true)
}

router.requestBuilder('map',wrapBuilder(mapBuilder))

@Component
export struct MapPage{

  address:geoLocationManager.GeoAddress | undefined

  private local:Location = new Location

  private TAG = "HuaweiMapDemo";
  private mapOptions?: mapCommon.MapOptions;
  private callback?: AsyncCallback<map.MapComponentController>;
  private mapController?: map.MapComponentController;
  private selectMap?: MarkerMap;
  private marker?: map.Marker;

  aboutToAppear(): void {
    let latLng = this.local.toGCJ02({
      latitude: this.address!.latitude!,
      longitude: this.address!.longitude!,
    })
    // 地图初始化参数，设置地图中心点坐标及层级
    this.mapOptions = {
      position: {
        zoom: 17,
        target: {
          latitude: latLng.latitude!,
          longitude: latLng.longitude!,
        },
      },
      mapType: mapCommon.MapType.STANDARD,
      myLocationControlsEnabled: true,
      sphereEnabled: true
    };

    // 地图初始化的回调
    this.callback = async (err, mapController) => {
      if (!err) {
        this.selectMap = new MarkerMap(mapController)
      }
    };
  }

   onPageShow():void{
    // 建议页面切换到前台，调用地图组件的show方法
    if (this.mapController) {
      this.mapController.show();
    }
  }

  // 页面每次隐藏时触发一次，包括路由过程、应用进入后台等场景，仅@Entry装饰的自定义组件生效
  onPageHide(): void {
    // 建议页面切换到后台，调用地图组件的hide方法
    if (this.mapController) {
      this.mapController.hide();
    }
  }

  @Builder
  rightBuilder(){
    Text("确认").onClick(()=>{
      router.pop(this.address);
    })
  }

  build() {
    Column(){
      NavBar({title:"选择地址",rightBuilderParam:this.rightBuilder.bind(this)});
      MapComponent({ mapOptions: this.mapOptions, mapCallback: this.callback }).width('100%').height(global.getContentTabBar())
    }
  }
}