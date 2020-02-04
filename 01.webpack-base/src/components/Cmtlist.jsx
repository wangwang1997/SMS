import React from 'react'

import CmtItem from '@/components/CmtItem'
export default class Cmtlist extends React.Component{

    constructor(){
        super()
        this.state = {
            CommentList:[
                {id:1,user:'张三',content:'沙发'},
                {id:2,user:'李四',content:'板凳'},
                {id:3,user:'王五',content:'地铺'},
                {id:4,user:'赵六',content:'沙发。。。'},
                {id:5,user:'田七',content:'沙发。。。。。'}
            ]
        }
    }
    render(){
        return <div>
            {/*在jsx中写行内样式不能直接设置字符串值，要用{{}} */}
            {/*行内样式中如果是数值类型的样式可以不用引号包裹 */}
            <h1 style={{color:'red',fontSize:'35px',zIndex:1,fontWeight:20,textAlign:'center'}}>这是评论列表组件</h1>
            {this.state.CommentList.map(item =><CmtItem {...item} key={item.id}></CmtItem>)}
        </div>
    }
}