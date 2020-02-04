
// webpack-dev-server打包好的 main.js是托管到内存中了

//导入这两个接受成员必须这么写

import React from 'react' //创建组件、虚拟dom元素，生命周期
import ReactDOM from 'react-dom' //把创建好的组件和虚拟dom放到页面上展示

// //这是父类
// class Human{
//     constructor(name ,age){
//         this.name = name
//         this.age = age
//     }
//     //实例方法
//     sayHello(){
//         console.log('Hello')
//     }
// }
// //在class类中可以使用extends关键字来继承父类
// class American extends Human{
//    //为什么一定要在constructor中调用super() -- 因为一个子类通过extends继承父类，那么子类的constructor函数中优先调用super()
//    //super()是什么 -- super()是一个函数，而且是父类的构造器，子类中的super其实是父类构造器的引用
//    //为什么调用super()之后，实例的属性变为underfined？ -- 
//    constructor(name ,age){
//        super(name, age)
//    }
// }

// const a1 = new American('Jake','19')
// console.log(a1)

// class Chinese extends Human{
//     constructor(name ,age,id){
//         //语法规范，在子类中，this只能放到super之后使用
//         super(name, age)
//         this.id = id
//     }
// }
// const c1 = new Chinese('zhangsan','19','1233213212')
// console.log(c1)
// c1.sayHello()

const user = {
    name :'zs',
    age :13
}
console.log(user)
//class关键字创建组件
class Movie extends React.Component{

    constructor(){
        //由于Movie继承了父类
        //所以必须调用super
        super()
        //调用super之后才能使用this
        this.state ={
            msg:'大家好，我是class创建的'
        }//state相当于vue中的data
    }
    //render函数的作用是渲染当前组件所对应的虚拟DOM元素
    //不论是class还是fucntion创建的组件，都是只读的，不能被重新赋值
    render(){
        this.state.msg = 'zbxg'
    return <div>这是class创建的组件 -- {this.props.name} -- {this.props.age}
    <h3>{this.state.msg}</h3>
    </div>
    }
}

ReactDOM.render(<div>
123
{/*这里的movie标签其实是movie类的实例对象 */}
{/*在class创建的组件中，如果想使用外界传过来的props参数不需接受，直接this.props.*** 访问*/}
{/* <Movie name={user.name} age={user.age}></Movie> */}
<Movie {...user}></Movie>
</div>,document.getElementById('app'))