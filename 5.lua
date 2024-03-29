userList = {
    { 598, 172, 0 },
    { 482, 173, 0 },
    { 369, 208, 0 },
    { 445, 167, 0 },
}

save_list_map = {}

modifyTheValue = { 9999, 999, 9998, 998, 3999, 20, 20, 3998 }
modifyTheName = { "物抗", "物攻", "魔抗", "魔攻", "最大血量", "当前能量", "最大能量", "当前血量" }
offsetThePointer = {
    -- 物抗，物攻，魔抗，魔攻，最大血量，当前能量，最大能量，当前血量
    [1] = { -720, -520, -440, -280, -200, -160, -40, 0 },
    [2] = { -720 + 200, -520 + 200, -440 + 200, -280 + 200, -200 + 200, -160 + 200, -40 + 200, 0 + 200 },
    [3] = { -720 + 720, -520 + 720, -440 + 720, -280 + 720, -200 + 720, -160 + 720, -40 + 720, 0 + 720 },
    [4] = { -720 + 520, -520 + 520, -440 + 520, -280 + 520, -200 + 520, -160 + 520, -40 + 520, 0 + 520 },
    [5] = { -720 + 440, -520 + 440, -440 + 440, -280 + 440, -200 + 440, -160 + 440, -40 + 440, 0 + 440 },
    [6] = { -720 + 280, -520 + 280, -440 + 280, -280 + 280, -200 + 280, -160 + 280, -40 + 280, 0 + 280 },
}

function Main0()
    SN = gg.choice({
        "修改",
        "一键修改",
        "运行历史修改",
        "删除历史修改",
    }, nil, "")
    if SN == 1 then
        Main1()

    elseif SN == 2 then
        for i = 1, #userList do
            print(userList[i])
            do_table(userList[i])
        end
    elseif SN == 3 then
        runHistoryEdit()
    elseif SN == 4 then
        removeHistoryEdit()
    end
    FX1 = 0
end
historyInfo = {}
function removeHistoryEdit()
    multiChoiceOptions = { "全选" }
    for k, v in pairs(historyInfo) do
        table.insert(multiChoiceOptions, k)
    end
    menu = gg.multiChoice(multiChoiceOptions, nil, "这里可以随便写")
    if menu == nil then
        return
    end
    if menu[1] == true then
        historyInfo = {}
        gg.toast("删除完成")
        return
    end
    newHistoryInfo = {}
    for k, v in pairs(menu) do
        if v == false then
            newHistoryInfo[k] = historyInfo[k]
        end
    end
    historyInfo = newHistoryInfo
end
function runHistoryEdit()
    multiChoiceOptions = { "全选" }
    for k, v in pairs(historyInfo) do
        table.insert(multiChoiceOptions, k)
    end
    menu = gg.multiChoice(multiChoiceOptions, nil, "这里可以随便写")
    if menu == nil then
        return
    end
    if menu[1] == true then
        for k, v in pairs(historyInfo) do
            do_table(v)
        end
        gg.toast("修改完成")
        return
    end
    for k, v in pairs(menu) do
        if v == true then
            do_table(historyInfo[k])
        end
    end
end

ggPreSearch = { [1] = 0, [2] = 0, [3] = 0, [4] = 0, [5] = 0, [6] = 0, [7] = '' }
function Main1()
    input_info = gg.prompt(
            { '当前生命值(如果为0,取最大生命值)',
              '最大生命值',
              '物抗(如果为0往下作为特征值)',
              '物攻(如果为0往下作为特征值)',
              '魔抗(如果为0往下作为特征值)',
              '魔攻',
              '名称'
            }, ggPreSearch, { [1] = 'number', [2] = 'number', [3] = 'number', [4] = 'number', [5] = 'number', [6] = 'number', [7] = 'text' }
    )
    if input_info == nil then
        return
    end
    ggPreSearch = input_info
    do_table(input_info)
end

function findByHp(searchStr, input_info)
    gg.clearResults()
    gg.setRanges(4)
    gg.searchNumber(searchStr, gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1)
    search1 = gg.getResults(10)
    if #search1 <= 0 then
        gg.alert("查询异常：" .. searchStr)
        return -1
    end
    gg.searchNumber(input_info[2], gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1)
    list = {}
    search2 = gg.getResults(1000)
    for i = 1, #search2 do
        list[i] = { address = search2[i].address, flags = gg.TYPE_DOUBLE, freeze = false, value = input_info[2] + i }
    end
    gg.setValues(list)
    while true do
        if gg.isVisible(true) then
            newHPValue = gg.prompt({ '请输入最大血量数据' }, { [1] = input_info[2] }, { [1] = 'number' })
            gg.setVisible(false)
        end
        if newHPValue == nil then
        else
            break
        end
    end
    gg.searchNumber(newHPValue[1], gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1)
    search2 = gg.getResults(10)
    offsetThePointerAddress = offsetThePointer[5]
    for i = 1, #search2 do
        list = {}
        for j = 1, #offsetThePointerAddress do
            list[j] = { address = search2[i].address + offsetThePointerAddress[j], flags = gg.TYPE_DOUBLE, freeze = false, value = modifyTheValue[j] }
        end
        gg.setValues(list)
        gg.addListItems(list)
    end
end
function checkAddressValue(address, min, max, ggType)
    gg.clearResults()
    gg.searchAddress(address, ggType, false, gg.SIGN_EQUAL, 0, -1)
    local result = gg.getResults(1)
    if #result <= 0 then
        return false
    end
    if min <= result[0].value and result[0] <= max then
        return true
    else
        return false
    end
end
function do_table(input_info)
    if input_info[2] .. '' == '0' then
        input_info[2] = input_info[1]
    end
    offsetThePointerIndex = 0
    searchStr = input_info[1]
    for i = 2, #input_info do
        if i == 7 then
            --       名称不查询
        elseif input_info[i] .. '' ~= '0' and input_info[i] .. '' ~= '' then
            searchStr = searchStr .. ';' .. input_info[i]
            offsetThePointerIndex = i
        end
    end
    searchStr = searchStr .. '::'
    if offsetThePointerIndex == 0 then
        gg.alert("没法搜索:" .. searchStr)
    end
    gg.clearResults()
    gg.setRanges(4)
    gg.searchNumber(searchStr, gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1)
    search1 = gg.getResults(10)
    if #search1 <= 0 then
        gg.alert("查询异常：" .. searchStr)
        return -1
    end
    gg.searchNumber(input_info[offsetThePointerIndex], gg.TYPE_DOUBLE, false, gg.SIGN_EQUAL, 0, -1)
    search2 = gg.getResults(100)
    if #search2 > 5 then
        choiceIndex = gg.alert("查询结果太多，请选择搜寻模式", '改变血量', '我不在乎直接修改', '取消')
        -- 血量查询
        if choiceIndex == 1 then
            findByHp(searchStr, input_info)
            return
        elseif choiceIndex == 2 then
        elseif choiceIndex == 3 then
            return
        end
    end
    offsetThePointerAddress = offsetThePointer[offsetThePointerIndex]
    for i = 1, #search2 do
        list = {}
        for j = 1, #offsetThePointerAddress do
            if checkAddressValue(search2[i].address + offsetThePointerAddress[j],1,9999,gg.TYPE_DOUBLE) then
                list[j] = { address = search2[i].address + offsetThePointerAddress[j], flags = gg.TYPE_DOUBLE, freeze = false, value = modifyTheValue[j], name = modifyTheName[j] }
            else
                print("修改错误："..modifyTheName[j].."从"..modifyTheName[offsetThePointerIndex].."修改的")
                gg.alert("修改错误："..modifyTheName[j])
            end
        end
        gg.setValues(list)
        gg.addListItems(list)
    end
    historyInfo[searchStr] = input_info
    gg.toast("修改完成：" .. input_info[7])
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