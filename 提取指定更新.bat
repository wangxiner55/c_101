@echo off

:: �л����ű�����Ŀ¼
cd /d %~dp0

:: ���¼�¼
git fetch


:: ��ʾ�û������ύ�Ĺ�ϣֵ
set /p hash=������Ŀ���ύ�Ĺ�ϣֵ�� 

:: ��������Ƿ�Ϊ��
if "%hash%"=="" (
    echo ���󣺹�ϣֵ����Ϊ�գ�
    pause
    exit /b
)

:: ִ�� git cherry-pick ���ָ����ͻ�������
git cherry-pick %hash% -X theirs

:: ��� cherry-pick �Ƿ�ɹ�
if %errorlevel% equ 0 (
    echo cherry-pick �ɹ���
) else (
    echo cherry-pick ʧ�ܣ������ͻ���ϣֵ�Ƿ���ȷ��
)

pause
