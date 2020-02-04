const path = require('path')
const HtmlWebPackPlugin = require('html-webpack-plugin') //导入在内存中自动生成 index页面

//创建一个插件实例
const htmlPlugin = new HtmlWebPackPlugin({
    template: path.join(__dirname , './src/index.html'),//源文件
    filename: 'index.html' //生成的内存中的首页名称
})


//向外暴露一个接口
// webpack 默认只能打包.js后缀类型的文件，像png vue无法主动处理，所以要配置第三方
module.exports = {
    mode:'development',
    plugins:[
        htmlPlugin
    ],
    module: {//所有第三方模块的匹配规则
        rules:[ // 第三方匹配规则
            { test: /\.js|jsx$/ ,use: 'babel-loader',exclude:/node_modules/ },//千万别忘记添加exclude排除项
            //css-loader可以在之后追加参数，其中有个固定参数叫做modules，表示为普通css样式表启用模块化
            { test:/\.css$/,use: ['style-loader','css-loader?modules'] },//打包处理css样式表的第三方
            //{ test: /\.jpg|png|gif|bmp$/}
        ]
    },
    resolve:{
        extensions:['.js','.jsx','.json'],//表示，这几个文件的后缀名，可以省略不写
        alias:{//表示别名
            '@' :path.join(__dirname ,'./src') //这样，@就表示项目根目录下的src的这一层路径
        }
    }

}