

export const Model: ClassDecorator = (target) => {
  console.log("RefreshMDecorator：" + target.toString())
}

@Model
export  class BaseModel{
  id:number | undefined

}