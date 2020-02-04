
// webpack-dev-server打包好的 main.js是托管到内存中了

//导入这两个接受成员必须这么写

import React from 'react' //创建组件、虚拟dom元素，生命周期
import ReactDOM from 'react-dom' //把创建好的组件和虚拟dom放到页面上展示

//导入组件
//默认如果不单独做配置的话，不能省略jsx后缀名
//'@' 符号 表示项目根目录中src的一层目录
import Hello from '@/components/Hello'

//创建虚拟dom元素
//参数1:创建的元素的类型，字符串，表示元素的名称
//参数2:是一个对象或null 表示当前dom的属性
//参数3:子节点（包括 其它 虚拟dom获取 文本子节点）
//参数n：其它子节点
// const myh1 = React.createElement('h1',{id:'myh1',title:'this is a h1'},'这是一个h1')

// const mydiv = React.createElement('div',null,'这是div元素',myh1)

//渲染页面上的dom结构，最好的方式就是写html代码

// const mytest = <div>aaa</div>
//注意：在JS文件中，默认不能写这种类似html的标记；否则会打包失败
//可以使用babel来转换这些js标签
//这种在JS中混合写入html的语法，叫做jsx语法；符合xml规范的js
//JSX的语法本质，还是在运行的时候被转换成React.creatElement形式执行
const mydiv = <div id="mydiv" title="div aaa">这是一个div元素
<h1>这是一个大大的h1</h1>
</div>

// let a =10
// let str = 'hello world'
// let boo = true
// let title ='999'
// const h1=<h1>哈哈哈哈哈哈</h1>
// const arr = [
//     <h2>这是h2</h2>,
//     <h3>这是h3</h3>
// ]
// const arrStr = ['毛利兰','柯南','灰原哀']


//定义一个空数组，用来存放名称标签 方案一
//const nameArr =[]
//注意React中需要把key添加给被 forEach或map或for循环直接控制的元素
// arrStr.forEach(item =>{
//     const temp = <h5 key={item}>{item}</h5>
//     nameArr.push(temp)
// })

//数组的 map 方法 map中必须要return
// const result = arrStr.map(item =>{
//     return item + '~~'
// })
// console.log(result)

//使用reactdom渲染
//参数1:要渲染的虚拟dom元素
//参数2:指定页面上一个容器(dom元素)
// ReactDOM.render(mydiv,document.getElementById('app'))

//变量写法
//jsx xml比html严格
//什么时候要用{}呢？当我们需要在jsx控制区域内，则需要写{}
// ReactDOM.render(<div>
//     {a+1}
//     <hr />
//     {str}
//     <hr />
//     {boo.toString()}
//     <hr />
//     <p title={title}>oookkkk</p>
//     {h1}
//     <hr />
//     {/* {arr} */}
//     <hr />
//     {nameArr}
//     <hr />
//     {arrStr.map(item =><div key={item}><h3>{item}</h3></div>)}
//     <p className="thi">hk</p>
//     <label htmlFor="">111</label>
//     </div>,document.getElementById('app'))


//第一种创建组件的方式
//组件首字母为大写
// function Hello(props){
//     //如果在一个组件中return一个null，则此组件是空的，什么都不会渲染
//     //在组件中必须返回一个合法的jsx虚拟dom元素
//     console.log(props)
//    //结论：不论是vue还是react，组件中的props永远是只读的，不能被重新赋值 
//     return <div>这是hello组件 -- {props.name} -- {props.age} -- {props.gender}</div>
// }
//props只读
const dog ={
    name:'大黄',
    age:3,
    gender:'雄'
}

const o2 = {
    name: '张三',
    age: 22,
    address: '中国北京',
    phone:'13333'
}

console.log(o2)

ReactDOM.render(<div>
{/* <Hello name={dog.name} age={dog.age} gender={dog.gender}></Hello> */}
<Hello {...dog}></Hello>

</div>,document.getElementById('app'))

