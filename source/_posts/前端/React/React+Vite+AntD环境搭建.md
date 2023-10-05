---
title: React+Vite+AntD环境搭建
description: 使用React、Vite、AntDesign搭建环境
excerpt: 摘要
tags:
  - React
  - TypeScript
  - Vite
categories:
  - 开发
  - 前端
photos:
  - https://vitejs.dev/logo-with-shadow.png
  - https://gw.alipayobjects.com/zos/rmsportal/KDpgvguMpGfqaHPjicRK.svg
  - https://repository-images.githubusercontent.com/37153337/9d0a6780-394a-11eb-9fd1-6296a684b124
comments: true
abbrlink: e6d089d8
date: 2023-10-05 11:28:56
---

# 初始化Vite
```sh
npm init vite@latest
```
按照提示进行初始，我这里项目名称叫：web-vite  选择React TypeScript 进行搭建演示
√ Project name: ... web-vite
√ Select a framework: » React
√ Select a variant: » TypeScript

# 安装AntD
	AntD官网介绍：https://ant.design/docs/react/i18n-cn

```sh
npm install antd --save
```

# 运行项目
进入你的项目（我的是 web-vite）
安装依赖
启动项目
```cmd
  cd web-vite
  npm install
  npm run dev
```
![image.png](https://yjl-img.oss-cn-beijing.aliyuncs.com/_post/20231005113525.png)

# AntD国际化配置

在main.tsx中加入国际化代码
```tsx
import zhCN from 'antd/locale/zh_CN';  
import { ConfigProvider } from 'antd';
```

```tsx
<ConfigProvider locale={zhCN}>  
    <App />
</ConfigProvider>
```

![image.png](https://yjl-img.oss-cn-beijing.aliyuncs.com/_post/20231005114718.png)
引入一个时间选择组件查看效果
https://ant.design/components/date-picker-cn#components-date-picker-demo-basic

![image.png](https://yjl-img.oss-cn-beijing.aliyuncs.com/_post/20231005114756.png)
复制官网的组件代码到App1中，然后在主App中引入组件
![image.png](https://yjl-img.oss-cn-beijing.aliyuncs.com/_post/20231005114910.png)

# 路由安装
## 一、安裝react-router-dom
	react-router-dom官网：https://reactrouter.com/en/main
	中文文档：https://react-guide.github.io/react-router-cn/docs/Introduction.html
	
```sh
npm i react-router-dom
```
## 二、修改main.tsx全局设定路由
```tsx
import React from 'react'  
import ReactDOM from 'react-dom/client'  
import App from './App.tsx'  
import './index.css'  
import zhCN from 'antd/locale/zh_CN';  
import { ConfigProvider } from 'antd';  
import {BrowserRouter} from "react-router-dom";  
  
ReactDOM.createRoot(document.getElementById('root')!).render(  
  <React.StrictMode>  
      <ConfigProvider locale={zhCN}>  
          <BrowserRouter>  
              <App />  
          </BrowserRouter>  
      </ConfigProvider>  
  </React.StrictMode>,  
)
```
![image.png](https://yjl-img.oss-cn-beijing.aliyuncs.com/_post/20231005154840.png)
## 三、定义路由
创建文件router/index.tsx
```tsx
import {Route, Routes} from "react-router-dom";  
// 定义的页面1
import Home from "../views/Home";  
// 定义的页面2
import App1 from "../apps/App1";  
  
// 定义路由  
const routeList = [  
    {path: '/', title: '/', element: Home},  
    {path: '/view1', title: 'page2', element: App1},  
]  
  
export default function Router() {  
    return (  
        <div>  
            <Routes>  
                {  
                    routeList.map((item, index) => (  
                        <Route key={index} path={item.path} element={<item.element/>}/>  
                    ))  
                }  
            </Routes>  
        </div>  
    )  
}
```
![image.png](https://yjl-img.oss-cn-beijing.aliyuncs.com/_post/20231005155026.png)
## 四、引用路由
在App.tsx中引用刚刚定义的路由，并简单添加路由跳转的导航
```tsx
import React, {useState} from 'react'  
import './App.css'  
import {Link} from "react-router-dom";  
import Router from "./router/index";  
  
  
function App() {  
    return (  
        <>  
            <Link to="/"><h4>Home</h4></Link>  
            <Link to="/view1"><h4>View1</h4></Link>  
            <Router/>  
        </>  
    )  
}  
  
export default App
```
![image.png](https://yjl-img.oss-cn-beijing.aliyuncs.com/_post/20231005155147.png)
## 五、效果展示
![image.png](https://yjl-img.oss-cn-beijing.aliyuncs.com/_post/20231005155330.png)
