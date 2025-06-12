export interface TestFace{ 
 	name:string | undefined 
	age:number | undefined 
	sex:string | undefined 
	type:object | undefined 
	data:TestData | undefined 
	list:Array<string> | undefined 
	dataList:Array<TestDataList> | undefined 
	listList:Array<Array<Array<Array<Array<TestListList>>>>> | undefined 
}

export class Test implements TestFace{
	name:string | undefined 
	age:number | undefined 
	sex:string | undefined 
	type:object | undefined 
	data:TestData | undefined 
	list:Array<string> | undefined 
	dataList:Array<TestDataList> | undefined 
	listList:Array<Array<Array<Array<Array<TestListList>>>>> | undefined 
	constructor(face:TestFace) {
		this.name = face.name 
		this.age = face.age 
		this.sex = face.sex 
		this.type = face.type 
		this.data = face.data 
		this.list = face.list 
		this.dataList = face.dataList 
		this.listList = face.listList 
	}
}

export interface TestDataFace{ 
 	status:number | undefined 
	title:string | undefined 
	found:TestDataFound | undefined 
}

export class TestData implements TestDataFace{
	status:number | undefined 
	title:string | undefined 
	found:TestDataFound | undefined 
	constructor(face:TestDataFace) {
		this.status = face.status 
		this.title = face.title 
		this.found = face.found 
	}
}

export interface TestDataFoundFace{ 
 	status:number | undefined 
	title:string | undefined 
}

export class TestDataFound implements TestDataFoundFace{
	status:number | undefined 
	title:string | undefined 
	constructor(face:TestDataFoundFace) {
		this.status = face.status 
		this.title = face.title 
	}
}

export interface TestDataListFace{ 
 	status:number | undefined 
	title:string | undefined 
}

export class TestDataList implements TestDataListFace{
	status:number | undefined 
	title:string | undefined 
	constructor(face:TestDataListFace) {
		this.status = face.status 
		this.title = face.title 
	}
}

export interface TestListListFace{ 
 	status:number | undefined 
	title:string | undefined 
}

export class TestListList implements TestListListFace{
	status:number | undefined 
	title:string | undefined 
	constructor(face:TestListListFace) {
		this.status = face.status 
		this.title = face.title 
	}
}

