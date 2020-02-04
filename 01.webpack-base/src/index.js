
// webpack-dev-server打包好的 main.js是托管到内存中了

//导入这两个接受成员必须这么写

import React from 'react' //创建组件、虚拟dom元素，生命周期
import ReactDOM from 'react-dom' //把创建好的组件和虚拟dom放到页面上展示

import Cmtlist from '@/components/Cmtlist2'
//使用function构造无状态组件

//定义父组件使用class关键字



ReactDOM.render(<div>
<Cmtlist></Cmtlist>
</div>,document.getElementById('app'))