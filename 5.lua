userList={
{598 ,172 ,0 },
{482 ,173 ,0 },
{369 ,208 ,0 },
{445 ,167 ,0 },
}




save_list_map={}

modifyTheValue={9999,999,9998,998,3999,20,20,3998}
offsetThePointer={
-- 物抗，物攻，魔抗，魔攻，最大血量，当前能量，最大能量，当前血量
[1]={-720,-520,-440,-280,-200,-160,-40,0},
[2]={-720+200,-520+200,-440+200,-280+200,-200+200,-160+200,-40+200,0+200},
[3]={-720+720,-520+720,-440+720,-280+720,-200+720,-160+720,-40+720,0+720},
[4]={-720+520,-520+520,-440+520,-280+520,-200+520,-160+520,-40+520,0+520},
[5]={-720+440,-520+440,-440+440,-280+440,-200+440,-160+440,-40+440,0+440},
[6]={-720+280,-520+280,-440+280,-280+280,-200+280,-160+280,-40+280,0+280},
}


function Main0()
  SN = gg.choice({
    "修改",
    "一键修改",
    "运行历史修改",
    "删除历史修改",
  }, nil, "")
  if SN==1 then
    Main1()
   elseif SN==2 then
    for i = 1, #userList do
        print(userList[i])
        do_table(userList[i])
    end
   elseif SN==3 then

  end
  FX1=0
end
historyInfo={}
function runHistoryEdit()
multiChoiceOptions={"全选"}
for k,v in ipairs(multiChoiceOptions) do
    multiChoiceOptions.insert(k)
end
menu = gg.multiChoice(,nil,"这里可以随便写")
    if menu == nil then
        return
    end
    if menu[1]==true then
         for k,v in ipairs(historyInfo) do
             do_table(v)
         end
        gg.toast("修改完成")
        return
    end
     for k,v in ipairs(menu) do
         if v ==true then
             do_table(historyInfo[k])
         end
     end

end

function Main2()
  SN = gg.choice({
    "血",
  }, nil, "这是一个公告")
  if SN==1 then

  end
  FX1=0
end
ggPreSearch={[1]=0,[2]=0,[3]=0,[4]=0,[5]=0,[6]=0,[7]=''}
function Main1()
  input_info= gg.prompt(
  {'当前生命值(如果为0,取最大生命值)',
  '最大生命值','物抗(如果为0往下作为特征值)',
  '物抗(如果为0往下作为特征值)',
  '物攻(如果为0往下作为特征值)',
  '魔抗(如果为0往下作为特征值)',
  '魔攻',
  '名称'
  },ggPreSearch,{[1]='number',[2]='number', [3]='number', [4]='number', [5]='number', [6]='number' [7]=''}
  )
  ggPreSearch=input_info
  do_table(input_info)
end


function do_table(input_info)
if input_info[1]..'' == '0' then
input_info[1]=input_info[2]
end
offsetThePointerIndex=0
searchStr=input_info[1]
for i = 2, #input_info do
    if i==7 then
--       名称不查询
    elseif input_info[i]..'' <> '0' then
        searchStr=searchStr..';'..input_info[i]
        offsetThePointerIndex=i
    end
end
searchStr=searchStr..':721'
if offsetThePointerIndex == 0 then
 gg.alert("没法搜索:"..searchStr)
end
gg.clearResults()
gg.setRanges(4)
gg.searchNumber(search_str, gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1)
search1=gg.getResults(10)
if #search1<=0 then
    gg.alert("查询异常："..searchStr)
    return -1
end
gg.searchNumber(input_info[offsetThePointerIndex], gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1)
search2=gg.getResults(10)
if #search2>5 then
    gg.alert("查询结果太多："..searchStr)
    return -1
end
    list={}
    offsetThePointerAddress=offsetThePointer[offsetThePointerIndex]
    for i = 1, #search2 do
        for j=1,#offsetThePointerAddress do
        list[j]={address = search1[i].address+offsetThePointerAddress[j],flags = gg.TYPE_DOUBLE,freeze = false,value = modifyTheValue[j]}
        end
    gg.setValues(list)
    gg.addListItems(list)
  end
  historyInfo[searchStr]=input_info
  gg.toast("修改完成："..input_info[7])
end


while true do
  if gg.isVisible(true) then
    FX1 = nil
    gg.setVisible(false)
  end
  if FX1 == nil then
    Main0()
  end
end_