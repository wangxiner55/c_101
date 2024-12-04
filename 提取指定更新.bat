@echo off

:: 切换到脚本所在目录
cd /d %~dp0

:: 更新记录
git fetch


:: 提示用户输入提交的哈希值
set /p hash=请输入目标提交的哈希值： 

:: 检查输入是否为空
if "%hash%"=="" (
    echo 错误：哈希值不能为空！
    pause
    exit /b
)

:: 执行 git cherry-pick 命令并指定冲突解决策略
git cherry-pick %hash% -X theirs

:: 检查 cherry-pick 是否成功
if %errorlevel% equ 0 (
    echo cherry-pick 成功！
) else (
    echo cherry-pick 失败，请检查冲突或哈希值是否正确。
)

pause
