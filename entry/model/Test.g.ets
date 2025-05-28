export interface TestFace{ 
 	name:string | undefined 
	age:number | undefined 
	sex:string | undefined 
	type:object | undefined 
	data:TestDataModel | undefined 
	list:Array<string> | undefined 
	dataList:Array<TestDataListModel> | undefined 
	listList:Array<Array<Array<Array<Array<TestListListModel>>>>> | undefined 
}

export class TestModel implements TestFace{
	name:string | undefined 
	age:number | undefined 
	sex:string | undefined 
	type:object | undefined 
	data:TestDataModel | undefined 
	list:Array<string> | undefined 
	dataList:Array<TestDataListModel> | undefined 
	listList:Array<Array<Array<Array<Array<TestListListModel>>>>> | undefined 

}

export interface TestDataFace{ 
 	status:number | undefined 
	title:string | undefined 
	found:TestDataFoundModel | undefined 
}

export class TestDataModel implements TestDataFace{
	status:number | undefined 
	title:string | undefined 
	found:TestDataFoundModel | undefined 

}

export interface TestDataFoundFace{ 
 	status:number | undefined 
	title:string | undefined 
}

export class TestDataFoundModel implements TestDataFoundFace{
	status:number | undefined 
	title:string | undefined 

}

export interface TestDataListFace{ 
 	status:number | undefined 
	title:string | undefined 
}

export class TestDataListModel implements TestDataListFace{
	status:number | undefined 
	title:string | undefined 

}

export interface TestListListFace{ 
 	status:number | undefined 
	title:string | undefined 
}

export class TestListListModel implements TestListListFace{
	status:number | undefined 
	title:string | undefined 

}

