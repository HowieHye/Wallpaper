echo "Start submitting code to the local repository"
git add .
echo;

get_char()
{
    SAVEDSTTY=`stty -g`
    stty -echo
    stty cbreak
    dd if=/dev/tty bs=1 count=1 2> /dev/null
    stty -raw
    stty echo
    stty $SAVEDSTTY
}

#unset msg
echo "Commit the changes to the local repository"
#read -p "请输入commit提交描述：" msg
git commit -m "$(date)"
echo;

echo "Commit the changes to the remote git server"
git push
echo;

echo "Batch execution complete!"
echo;

echo "Press any key to continue 。。。"
echo " CTRL+C break command bash ..." # 组合键 CTRL+C 终止命令!
char=`get_char`
echo " 操作完成 .... "