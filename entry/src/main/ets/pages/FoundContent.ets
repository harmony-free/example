import { global, NavBar, router } from "@free/global"
import { PageFace, RefreshList, RefreshUtils } from "@free/refresh"
import "./founddeatil/FoundDetail"

export class RefreshModel {
  title: string = "RefreshModel"
}

@Component
export struct FoundContent{

  @Builder
  itemBuilder(model:object){
    Text((model as RefreshModel).title).onClick(()=>{
      router.push('foundDetail')
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
      NavBar({title:"发现"})
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