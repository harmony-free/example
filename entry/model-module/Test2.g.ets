export interface Test2Face{ 
 	name:string | undefined 
	age:number | undefined 
	sex:string | undefined 
	type:object | undefined 
	data:Test2Data | undefined 
	list:Array<string> | undefined 
	dataList:Array<Test2DataList> | undefined 
	listList:Array<Array<Array<Array<Array<Test2ListList>>>>> | undefined 
}

export class Test2 implements Test2Face{
	name:string | undefined 
	age:number | undefined 
	sex:string | undefined 
	type:object | undefined 
	data:Test2Data | undefined 
	list:Array<string> | undefined 
	dataList:Array<Test2DataList> | undefined 
	listList:Array<Array<Array<Array<Array<Test2ListList>>>>> | undefined 
	constructor(face:Test2Face) {
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

export interface Test2DataFace{ 
 	status:number | undefined 
	title:string | undefined 
	found:Test2DataFound | undefined 
}

export class Test2Data implements Test2DataFace{
	status:number | undefined 
	title:string | undefined 
	found:Test2DataFound | undefined 
	constructor(face:Test2DataFace) {
		this.status = face.status 
		this.title = face.title 
		this.found = face.found 
	}
}

export interface Test2DataFoundFace{ 
 	status:number | undefined 
	title:string | undefined 
}

export class Test2DataFound implements Test2DataFoundFace{
	status:number | undefined 
	title:string | undefined 
	constructor(face:Test2DataFoundFace) {
		this.status = face.status 
		this.title = face.title 
	}
}

export interface Test2DataListFace{ 
 	status:number | undefined 
	title:string | undefined 
}

export class Test2DataList implements Test2DataListFace{
	status:number | undefined 
	title:string | undefined 
	constructor(face:Test2DataListFace) {
		this.status = face.status 
		this.title = face.title 
	}
}

export interface Test2ListListFace{ 
 	status:number | undefined 
	title:string | undefined 
}

export class Test2ListList implements Test2ListListFace{
	status:number | undefined 
	title:string | undefined 
	constructor(face:Test2ListListFace) {
		this.status = face.status 
		this.title = face.title 
	}
}

