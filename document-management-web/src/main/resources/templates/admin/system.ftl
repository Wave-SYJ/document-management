<#include "/components/admin-layout.ftl"/>

<@adminLayout currentPage="system" title="系统管理 - 文献搜索和管理系统">
    <table class="ui celled striped table" style="margin-bottom: 10px">
        <thead>
        <tr>
            <th colspan="2">
                CPU
            </th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td class="collapsing">核心数</td>
            <td>${info.cpu.cpuNum}</td>
        </tr>
        <tr>
            <td class="collapsing">系统使用率</td>
            <td>${info.cpu.getSys()} %</td>
        </tr>
        <tr>
            <td class="collapsing">用户使用率</td>
            <td>${info.cpu.getUsed()} %</td>
        </tr>
        <tr>
            <td class="collapsing">当前等待率</td>
            <td>${info.cpu.getWait()} %</td>
        </tr>
        <tr>
            <td class="collapsing">当前空闲率</td>
            <td>${info.cpu.getFree()} %</td>
        </tr>

        </tbody>
    </table>

    <table class="ui celled striped table" style="margin-bottom: 10px">
        <thead>
        <tr>
            <th colspan="2">
                内存
            </th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td class="collapsing">内存总量</td>
            <td>${info.mem.total} GB</td>
        </tr>
        <tr>
            <td class="collapsing">已用内存</td>
            <td>${info.mem.used} GB</td>
        </tr>
        <tr>
            <td class="collapsing">剩余内存</td>
            <td>${info.mem.free} GB</td>
        </tr>
        </tbody>
    </table>

    <table class="ui celled striped table" style="margin-bottom: 10px">
        <thead>
        <tr>
            <th colspan="2">
                Java 虚拟机
            </th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td class="collapsing">当前 JVM 占用的内存总数</td>
            <td>${info.jvm.total} MB</td>
        </tr>
        <tr>
            <td class="collapsing">JVM 最大可用内存总数</td>
            <td>${info.jvm.max} MB</td>
        </tr>
        <tr>
            <td class="collapsing">JVM 空闲内存</td>
            <td>${info.jvm.free} MB</td>
        </tr>
        <tr>
            <td class="collapsing">JDK 版本</td>
            <td>${info.jvm.version}</td>
        </tr>
        <tr>
            <td class="collapsing">JDK 路径</td>
            <td>${info.jvm.home}</td>
        </tr>
        <tr>
            <td class="collapsing">Java 启动时间</td>
            <td>${info.jvm.getStartTime()}</td>
        </tr>
        <tr>
            <td class="collapsing">Java 运行时间</td>
            <td>${info.jvm.getRunTime()}</td>
        </tr>
        </tbody>
    </table>

    <table class="ui celled striped table" style="margin-bottom: 10px">
        <thead>
        <tr>
            <th colspan="2">
                服务器
            </th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td class="collapsing">服务器名称</td>
            <td>${info.sys.computerName}</td>
        </tr>
        <tr>
            <td class="collapsing">服务器 IP</td>
            <td>${info.sys.computerIp}</td>
        </tr>
        <tr>
            <td class="collapsing">项目路径</td>
            <td>${info.sys.userDir}</td>
        </tr>
        <tr>
            <td class="collapsing">操作系统</td>
            <td>${info.sys.osName}</td>
        </tr>
        <tr>
            <td class="collapsing">系统架构</td>
            <td>${info.sys.osArch}</td>
        </tr>
        </tbody>
    </table>

    <table class="ui celled striped table">
        <thead>
        <tr>
            <th colspan="7">
                磁盘
            </th>
        </tr>
        <tr>
            <th>盘符路径</th>
            <th>盘符类型</th>
            <th>文件类型</th>
            <th>总大小</th>
            <th>剩余大小</th>
            <th>已使用量</th>
        </tr>
        </thead>

        <tbody>
        <#list info.sysFiles as sysFile>
            <tr>
                <td>${sysFile.dirName}</td>
                <td>${sysFile.sysTypeName}</td>
                <td>${sysFile.typeName}</td>
                <td>${sysFile.total}</td>
                <td>${sysFile.free}</td>
                <td>${sysFile.used}</td>
            </tr>
        </#list>
        </tbody>
    </table>

</@adminLayout>