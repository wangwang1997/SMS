
// webpack-dev-server打包好的 main.js是托管到内存中了

//导入这两个接受成员必须这么写

import React from 'react' //创建组件、虚拟dom元素，生命周期
import ReactDOM from 'react-dom' //把创建好的组件和虚拟dom放到页面上展示


//在ES6中class关键字实现面向对象编程的新形势
//1.传统方式
function Person(name, age){
    this.name = name
    this.age = age
}

//info为静态属性
Person.info = 'aaa'
//静态方法
Person.show = function (){
    console.log('这是Person的静态方法')
}
//实例方法
Person.prototype.say = function() {
    console.log('这是Person的实例方法')
}

const p1 = new Person('王多多', 18)
//通过new出来的实例，访问到的属性，叫做实例属性
console.log(p1)
p1.say()//这是实例方法
Person.show()
//静态属性：通过构造函数直接访问到的属性，叫做静态属性


//2.class关键字
//创建了一个动物类
class Animal{ 
    //这是类中的构造器
    //每个类中都有一个构造器，如果没有手动制定构造器，则默认构造一个构造器
    //构造器的作用就是，每当new一个类时，必然会优先执行构造器的代码
    constructor(name, run){
        //实例属性
        this.name = name
        this.run = run 
    }
    //在class内部，通过static修饰的属性就是静态属性
    static info = 'eee'
    //Animal的实例方法
    Skill(){
        console.log('这是Animal的实例方法')
    }
    static Show(){
        console.log('这是Animal的静态方法')
    }
}

const a1 = new Animal('狮子','会跑')
console.log(a1)
a1.Skill()
Animal.Show()
ReactDOM.render(<div>
123
</div>,document.getElementById('app'))