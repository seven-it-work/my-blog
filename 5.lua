user1={598 ,172 ,0 }
user2={482 ,173 ,0 }
user3={369 ,208 ,0 }
user4={445 ,167 ,0 }







function Main0()
  SN = gg.choice({
    "一级菜单",
    "一键修改",
  }, nil, "")
  if SN==1 then
    Main1()
   elseif SN==2 then
    if #user1 ~= 0 then
      do_table(user1)
    end
    if #user2 ~= 0 then
      do_table(user2)
    end
    if #user3 ~= 0 then
      do_table(user3)
    end
     if #user4 ~= 0 then
      do_table(user4)
    end
  end
  FX1=0
end

function Main1()
  SN = gg.choice({
    "血",
  }, nil, "这是一个公告")
  if SN==1 then
    HS2()
  end
  FX1=0
end

function HS2()
  input_info= gg.prompt(
  {'当前生命值', '魔法攻击力', '最大生命值'},
  {[1]=0,[2]=0,[3]=0},
  {[1]='number',[2]='number', [3]='number'}
  )
  
  do_table(input_info)
end


function do_table(input_info)
if input_info[3]==0 then
    input_info[3]=input_info[1]
  end
  search_str=input_info[1]..';'..input_info[2]..';'..input_info[3]..'::'
  gg.clearResults()
  gg.setRanges(4)
  gg.searchNumber(search_str, gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1)
  search1=gg.getResults(10)
 
  if #search1<=0 then
    gg.alert("查询异常")
    return 1
  end
  gg.searchNumber(input_info[2], gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1)
  re=gg.getResults(10)
  for i = 1, #re do
    -- arr[i]
    print(re[i])
    gg.setValues({[1] = {address = re[i].address-160,flags = gg.TYPE_DOUBLE,freeze = false,value = 999},
      [2]={address = re[i].address-240,flags = gg.TYPE_DOUBLE,freeze = false,value = 1999},
      [3]={address = re[i].address-240-120,flags = gg.TYPE_DOUBLE,freeze = false,value = 2999},
      [4]={address = re[i].address-240-120-40,flags = gg.TYPE_DOUBLE,freeze = false,value = 19},
      [5]={address = re[i].address-240-120-40-40,flags = gg.TYPE_DOUBLE,freeze = false,value = 999},
      [6]={address = re[i].address-240-120-40-40-80,flags = gg.TYPE_DOUBLE,freeze = false,value = 18},
      [7]={address = re[i].address-240-120-40-40-80-40,flags = gg.TYPE_DOUBLE,freeze = false,value = 2999},
      [8]={address = re[i].address,flags = gg.TYPE_DOUBLE,freeze = false,value = 799}
    })
  end

  gg.toast("")

end


while true do
  if gg.isVisible(true) then
    FX1 = nil
    gg.setVisible(false)
  end
  if FX1 == nil then
    Main0()
  end
end