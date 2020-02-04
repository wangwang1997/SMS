import React from 'react'


export default function Hello(props){
    //如果在一个组件中return一个null，则此组件是空的，什么都不会渲染
    //在组件中必须返回一个合法的jsx虚拟dom元素
    console.log(props)
   //结论：不论是vue还是react，组件中的props永远是只读的，不能被重新赋值 
    return <div>这是hello组件 -- {props.name} -- {props.age} -- {props.gender}</div>
}

//把组件暴露
//export default Hello