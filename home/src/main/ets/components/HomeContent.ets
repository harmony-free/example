import { global, NavBar } from "@free/global"
import { PageFace, RefreshList, RefreshModel, RefreshUtils } from "@free/refresh"
import { normalView, refreshView } from "@free/refresh/src/main/ets/components/RefreshBuilder"



@Component
export struct HomeContent{

  @Builder
  itemBuilder(model:object){
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

  build() {
    Column(){
      NavBar({title:"首页"})
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