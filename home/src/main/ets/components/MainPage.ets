import { PageFace, RefreshList } from "@free/refresh";
export class RefreshModel {
  title: string = "RefreshModel"
}
@Entry
@Component
export struct MainPage {
  @State message: string = 'Hello World';

  @Builder
  itemBuilder(model:object){
    Text((model as RefreshModel).title)
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

    }
  }
}
