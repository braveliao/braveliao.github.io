---
title: Tool
tags:
  - 常用工具
categories:
  - Tool
abbrlink: 17349
date: 2025-02-09 14:51:22
---

### 1. 在线json格式化
https://www.json.cn/

### 2. AI问答工具
https://chatgpt.com/

### 3. idea绘制uml
* 安装PlantUML插件
1. 打开 IntelliJ IDEA。
2. 在顶部菜单栏选择 File -> Settings。
3. 在设置窗口中，选择 Plugins。
4. 搜索 PlantUML，点击 Install 按钮进行安装。
5. 安装完成后，重启 IntelliJ IDEA。
* PlantUML代码参考
```dtd
@startuml
actor 运营 as User
participant 管理系统 as ManagementSystem
participant xx as API

User -> ManagementSystem : 创建会议并获取会议ID
note right of User
    会议ID从xx官网创建得到
end note
ManagementSystem -> API : 调用API接口获取会议详情
API -> ManagementSystem : 返回会议详情
ManagementSystem -> ManagementSystem : 填充会议详情到系统
ManagementSystem -> User : 完成录入
@enduml

```

