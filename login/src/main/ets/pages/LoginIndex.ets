import { NavBar } from "@free/global";

@Entry
@Component
export struct LoginIndex {
  @State message: string = 'Hello World';

  build() {
    Column() {
      NavBar({title:"登录"})
    }
    .width('100%')
  }
}