import { global, NavBar } from "@free/global"
import { PageFace, RefreshList, RefreshUtils } from "@free/refresh"
import "./founddeatil/FoundDetail"
import { router } from "@kit.ArkUI"

export class RefreshModel {
  title: string = "RefreshModel"
}

@Component
export struct ActivityContent{

  @Builder
  itemBuilder(model:object){
    Text((model as RefreshModel).title).onClick(()=>{
      // router.pushUrl({url:'pages/LoginIndex'})
      router.pushUrl({url:'@bundle:com.example.example/login/ets/pages/LoginIndex'})
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

  /**
   * 刷新
   */
  upData = (page?: PageFace):Promise<boolean | Array<object>> => {
    return new Promise<boolean | Array<object>>((res, rej) => {
      res([new RefreshModel])
    })
  }
  /**
   * 加载
   */
  downData = (page?: PageFace):Promise<boolean | Array<object>> => {
    return new Promise<boolean | Array<object>>((res, rej) => {
      res([new RefreshModel])
    })
  }


  build() {
    Column(){
      NavBar({title:"活动"})
      RefreshList({
        headerBuilderParam:this.headerBuilder,
        footerBuilderParam:this.footerBuilder,
        cachedCount:5,
        refresh:new RefreshUtils({upData:this.upData,downData:this.downData,data:[new RefreshModel]}),
        itemBuilderParam:this.itemBuilder,
      }).height(global.getContentHeight())
    }
  }
}