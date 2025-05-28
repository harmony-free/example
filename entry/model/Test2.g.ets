export interface Test2Face{ 
 	name:string | undefined 
	age:number | undefined 
	sex:string | undefined 
	type:object | undefined 
	data:Test2DataModel | undefined 
	list:Array<string> | undefined 
	dataList:Array<Test2DataListModel> | undefined 
	listList:Array<Array<Array<Array<Array<Test2ListListModel>>>>> | undefined 
}

export class Test2Model implements Test2Face{
	name:string | undefined 
	age:number | undefined 
	sex:string | undefined 
	type:object | undefined 
	data:Test2DataModel | undefined 
	list:Array<string> | undefined 
	dataList:Array<Test2DataListModel> | undefined 
	listList:Array<Array<Array<Array<Array<Test2ListListModel>>>>> | undefined 

}

export interface Test2DataFace{ 
 	status:number | undefined 
	title:string | undefined 
	found:Test2DataFoundModel | undefined 
}

export class Test2DataModel implements Test2DataFace{
	status:number | undefined 
	title:string | undefined 
	found:Test2DataFoundModel | undefined 

}

export interface Test2DataFoundFace{ 
 	status:number | undefined 
	title:string | undefined 
}

export class Test2DataFoundModel implements Test2DataFoundFace{
	status:number | undefined 
	title:string | undefined 

}

export interface Test2DataListFace{ 
 	status:number | undefined 
	title:string | undefined 
}

export class Test2DataListModel implements Test2DataListFace{
	status:number | undefined 
	title:string | undefined 

}

export interface Test2ListListFace{ 
 	status:number | undefined 
	title:string | undefined 
}

export class Test2ListListModel implements Test2ListListFace{
	status:number | undefined 
	title:string | undefined 

}

