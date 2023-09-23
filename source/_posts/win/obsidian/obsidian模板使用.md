---
title: obsidian模板使用
abstracts: 关于Obsidian官方插件模板的使用心得
feature: false
date: 2023-09-23 10:49:08
tags:
  - "#Obsidian"
  - "#Obsidian插件"
categories:
  - "#Obsidian"
cover: 
author: author-seven
---

# 设置

![image.png](https://yjl-img.oss-cn-beijing.aliyuncs.com/_post/20230923113519.png)
![image.png](https://yjl-img.oss-cn-beijing.aliyuncs.com/_post/20230923113602.png)

1. 开启模板开关（默认开启的）
2. 创建模板文件夹
	这里创建个obsidianTemplate

:::tip
模板文件夹命名不能有`-`字符
:::


3. 输入date 和 time 的语法，在模板中`{{date}}`和`{{time}}`会自动给你转换。类似的语法还有一下：
	* `{{title}}`

我这里的模板eg：

```markdown
---
title: {{title}}
abstracts: 
feature: false
date: {{date}}
tags:
categories:
cover: 
author: author-seven
---

待完善...
```
# 使用

创建一个新的md
![image.png](https://yjl-img.oss-cn-beijing.aliyuncs.com/_post/20230923114547.png)
插入模板
![image.png](https://yjl-img.oss-cn-beijing.aliyuncs.com/_post/20230923114618.png)
![image.png](https://yjl-img.oss-cn-beijing.aliyuncs.com/_post/20230923114730.png)
