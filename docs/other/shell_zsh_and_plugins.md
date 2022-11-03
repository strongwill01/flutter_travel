> 人类的强大在于不断模仿和自我改变！

## item2


## SHELL/CHANGE
* 查看已安装的SHELL
```
cat /etc/shells
```

* 查看当前启动的SHELL
```
echo $SHELL
```
输出结果:`/bin/zsh`

* 修改(切换)系统默认的SHELL(chsh -s /bin/zsh)
```
chsh -s /bin/bash
```

## ZSH
oh-my-zsh  

Linux下shell默认是bash，zsh是一种更强大的shell，功能也更加完善，配置稍稍有那么一点点🤏复杂。
为了方便使用，配置主题、命令自动补全和todo

* 安装
omit...

* 查看主题
```
ls .oh-my-zsh/themes
```

* 修改配置文件
```
vim ~/.zshrc
```
比如修改主题，修改`ZSH_THEME="主题名称"`，然后执行`source ~/.zshrc`，重新打开terminal就是最新主题了。

## plugin
### incr
[incr](https://mimosa-pudica.net/zsh-incremental.html)是一款自动提示插件，功能非常强大

* 安装,依次执行如下命令
```
wget http://mimosa-pudica.net/src/incr-0.2.zsh

mkdir ~/.oh-my-zsh/plugins/incr

mv incr-0.2.zsh ~/.oh-my-zsh/plugins/incr

echo 'source ~/.oh-my-zsh/plugins/incr/incr*.zsh' >> ~/.zshrc

source ~/.zshrc
```

### zsh-autosuggestions
命令自动补全插件，而且还包含历史输入进行自动补全。

* 安起来
```
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```

* 配置到插件列表中
```
vim ~/.zshrc

# 加入到插件列表中(搜索plugins定位到具体位置修改即可)
plugins=(
	git 
	zsh-autosuggestions 
	zsh-syntax-highlighting
)

source ~/.zshrc
```

### zsh-syntax-highlighting
该插件是高亮命令的，提高颜值，赏心悦目，提升效率～

* 装饰起来
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

```

* 配置到zsh的插件列表中
编辑配置文件`.zshrc`，将其插件加入到列表中，具体操作参考命令自动补全操作步骤。


> 提升效率，节约开发时间，何乐而不为～





