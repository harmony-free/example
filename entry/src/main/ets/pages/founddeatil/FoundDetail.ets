import { NavBar, router } from "@free/global"

@Builder
export function foundDetailBuilder(o:object){
  NavDestination(){
    FoundDetail()
  }.hideTitleBar(true)
}

router.requestBuilder('foundDetail',wrapBuilder(foundDetailBuilder))

@Component
export struct FoundDetail{
  build() {
    NavBar({title:"发现详情"})
  }
}