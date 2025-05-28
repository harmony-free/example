import { global, NavBar } from "@free/global";
import { router } from "@kit.ArkUI";

@Entry
@Component
export struct LoginIndex {
  @State message: string = 'Hello World';

  @State username:string = ""
  @State password:string = ""

  build() {
    Column() {
      NavBar({title:"登录"})
      TextInput({placeholder:"账号"}).onChange((v)=>{
        this.username = v
      })
      TextInput({placeholder:"密码"}).onChange((v)=>{
        this.password = v
      })
      Button("登录").onClick(()=>{
        if (this.username.length > 6 || this.password.length > 6) {
          global.storage.putFlush("token",`${this.username.length},${this.username.length}`);
           router.back();
        }
      })
    }
    .width('100%')
  }
}