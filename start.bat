@echo off
title Minecraft Paper Server
color 0a

REM ========================================
REM    Paper 서버 최적화 구동 스크립트
REM ========================================

REM 서버 설정
set RAM=4G
set SERVER_JAR=paper.jar

REM Java 최적화 플래그
set JAVA_OPTS=-Xms%RAM% -Xmx%RAM% -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:InitiatingHeapOccupancyPercent=15 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1

echo ==========================================
echo    Minecraft Paper Server 시작 중...
echo ==========================================
echo RAM: %RAM%
echo JAR: %SERVER_JAR%
echo ==========================================

:start
java %JAVA_OPTS% -jar %SERVER_JAR% --nogui
echo.
echo 서버가 종료되었습니다.
echo 10초 후 자동으로 재시작됩니다...
echo 재시작을 원하지 않으면 이 창을 닫으세요.
timeout /t 10
goto start
