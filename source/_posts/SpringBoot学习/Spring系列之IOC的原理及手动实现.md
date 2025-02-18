---
title: Spring Boot学习-手写ioc并理解核心原理
tags:
  - Spring Boot
categories:
  - Java
abbrlink: 17349
date: 2025-02-09 14:51:22
---

# 核心理解：
1. ioc的名字理解：全称为Inversion of Controller
```dtd
在传统的编程模型中，对象的创建和依赖关系是由程序本身显式控制的。也就是说，程序员需要手动创建对象并将它们注入到其他对象中。这种方式被称为 控制（Control），程序员有完全的控制权来管理对象的生命周期和依赖关系。

而 控制反转（IoC） 则是将这些控制权从程序中反转到框架或容器中。换句话说，IoC 允许框架（如 Spring）负责对象的创建和管理，而程序员则无需手动控制对象的生命周期和依赖关系。对象的创建和注入是由 IoC 容器来管理的。
```
2. 核心功能：对Bean进行管理，包括创建、使用、销毁等；
3. ioc最核心的实现方式：依赖注入（DI）;

# 核心代码实现：
1. 创建一个简单的接口和实现类：
```dtd
// 定义服务接口
public interface GreetingService {
    void greet();
}

// 实现 GreetingService
public class GreetingServiceImpl implements GreetingService {
    @Override
    public void greet() {
        System.out.println("Hello, welcome to IoC container!");
    }
}
```
2.创建一个简单的ioc容器
```dtd
import java.util.HashMap;
import java.util.Map;

// 简单的 IoC 容器实现
public class SimpleIoCContainer {
    private Map<Class<?>, Object> container = new HashMap<>();

    // 注册对象到容器
    public void register(Class<?> clazz, Object object) {
        container.put(clazz, object);
    }

    // 根据类型获取对象
    public <T> T getBean(Class<T> clazz) {
        return clazz.cast(container.get(clazz));
    }
}
```
3. 使用ioc容器
```dtd
import java.util.HashMap;
import java.util.Map;

// 简单的 IoC 容器实现
public class SimpleIoCContainer {
    private Map<Class<?>, Object> container = new HashMap<>();

    // 注册对象到容器
    public void register(Class<?> clazz, Object object) {
        container.put(clazz, object);
    }

    // 根据类型获取对象
    public <T> T getBean(Class<T> clazz) {
        return clazz.cast(container.get(clazz));
    }
}
```