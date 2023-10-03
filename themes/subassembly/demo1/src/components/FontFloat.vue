<script setup>
import {onMounted, onUpdated, reactive, ref, nextTick, onBeforeUpdate} from 'vue'

defineProps({})

const count = ref(0)


const dataList = reactive(FONT_FLOAT_DATA_INFO)
const showNowIndex = ref(0)
const showTimer=ref(setTimeout(()=>{}))

const nextClick = () => {
  const pre = showNowIndex.value
  showNowIndex.value++
  showNowIndex.value = showNowIndex.value === dataList.length ? 0 : showNowIndex.value
  for (let i = 0; i < dataList.length; i++) {
    dataList[i].isActive = false
  }
  dataList[showNowIndex.value].isActive = true
  changeA(dataList[pre], dataList[showNowIndex.value])
}
const preClick = () => {
  const pre = showNowIndex.value
  showNowIndex.value--
  showNowIndex.value = showNowIndex.value === -1 ? dataList.length - 1 : showNowIndex.value
  for (let i = 0; i < dataList.length; i++) {
    dataList[i].isActive = false
  }
  dataList[showNowIndex.value].isActive = true
  changeA(dataList[pre], dataList[showNowIndex.value])
}
const changeA = (pre, next) => {
  // 激活的动画
  for (let i = 0; i < next.titleList.length; i++) {
    const titleObj = next.titleList[i];
    const element = titleObj.element;
    element.style.zIndex = "9999"
    random2Neat({
      startTop: titleObj.top,
      startLeft: titleObj.left,
      endTop: titleObj.randomTop,
      endLeft: titleObj.randomLeft
    }, element)
  }
  for (let i = 0; i < next.descriptionList.length; i++) {
    const descriptionObj = next.descriptionList[i];
    const element = descriptionObj.element;
    random2Neat({
      startTop: descriptionObj.top,
      startLeft: descriptionObj.left,
      endTop: descriptionObj.randomTop,
      endLeft: descriptionObj.randomLeft
    }, element)
  }
  // 关闭动画
  for (let i = 0; i < pre.titleList.length; i++) {
    const titleObj = pre.titleList[i];
    const element = titleObj.element;
    element.style.zIndex = "-9999"
    neat2Random({
      startTop: titleObj.top,
      startLeft: titleObj.left,
      endTop: titleObj.randomTop,
      endLeft: titleObj.randomLeft
    }, element)
  }
  for (let i = 0; i < pre.descriptionList.length; i++) {
    const descriptionObj = pre.descriptionList[i];
    neat2Random({
      startTop: descriptionObj.top,
      startLeft: descriptionObj.left,
      endTop: descriptionObj.randomTop,
      endLeft: descriptionObj.randomLeft
    }, descriptionObj.element)
  }
}

const initChange = () => {
  // 激活的动画
  const dataListElement = dataList[showNowIndex.value];
  for (let i = 0; i < dataListElement.titleList.length; i++) {
    const titleObj = dataListElement.titleList[i];
    const element = titleObj.element;
    element.style.zIndex = "9999"
    random2Neat({
      startTop: titleObj.top,
      startLeft: titleObj.left,
      endTop: titleObj.randomTop,
      endLeft: titleObj.randomLeft
    }, element)
  }

  for (let i = 0; i < dataListElement.descriptionList.length; i++) {
    const descriptionObj = dataListElement.descriptionList[i];
    const element = descriptionObj.element;
    random2Neat({
      startTop: descriptionObj.top,
      startLeft: descriptionObj.left,
      endTop: descriptionObj.randomTop,
      endLeft: descriptionObj.randomLeft
    }, element)
  }

  // 除了激活的 全部到随机
  dataList.filter(item => !item.isActive).forEach(item => {
    for (let i = 0; i < item.titleList.length; i++) {
      const titleObj = item.titleList[i];
      const element = titleObj.element;
      element.style.zIndex = "-9999"
      neat2Random({
        startTop: titleObj.top,
        startLeft: titleObj.left,
        endTop: titleObj.randomTop,
        endLeft: titleObj.randomLeft
      }, element)
    }
    for (let i = 0; i < item.descriptionList.length; i++) {
      const descriptionObj = item.descriptionList[i];
      neat2Random({
        startTop: descriptionObj.top,
        startLeft: descriptionObj.left,
        endTop: descriptionObj.randomTop,
        endLeft: descriptionObj.randomLeft
      }, descriptionObj.element)
    }
  })
}

const getTop = () => {
  const offsetHeight = document.getElementById("mainFontFloat").offsetHeight;
  return Math.floor(Math.random() * offsetHeight);
}
const getLeft = () => {
  const offsetWidth = document.getElementById("mainFontFloat").offsetWidth;
  return Math.floor(Math.random() * offsetWidth);
}

const random2Neat = ({startTop, startLeft, endTop, endLeft}, element, isReverse = false) => {
  let rabbitDownKeyframes
  if (isReverse) {
    rabbitDownKeyframes = new KeyframeEffect(
        element,
        [
          {left: startLeft + "px", top: startTop + "px", color: "#000000", background: "#ffffff"},
          {
            left: endLeft + "px",
            top: endTop + "px",
            color: "rgb(221, 221, 221)",
            background: "rgba(255, 255, 255, 0.1)"
          },
        ],
        {duration: 3000, fill: 'forwards'}
    );
  } else {
    rabbitDownKeyframes = new KeyframeEffect(
        element,
        [
          {
            left: endLeft + "px",
            top: endTop + "px",
            color: "rgb(221, 221, 221)",
            background: "rgba(255, 255, 255, 0.1)"
          },
          {left: startLeft + "px", top: startTop + "px", color: "#000000", background: "#ffffff"},
        ],
        {duration: 3000, fill: 'forwards'}
    );
  }

  const rabbitDownAnimation = new Animation(rabbitDownKeyframes, document.timeline);
  rabbitDownAnimation.play();
}
const neat2Random = ({startTop, startLeft, endTop, endLeft}, element) => {
  random2Neat({
    startTop,
    startLeft,
    endTop,
    endLeft
  }, element, true)
}


function initA() {
  const elementById = document.getElementById("fontFloatCore");
  const elementsByTagName = elementById.getElementsByTagName("span");
  for (let i = 0; i < elementsByTagName.length; i++) {
    const elementsByTagNameElement = elementsByTagName[i];
    // const boundingClientRect = elementsByTagNameElement.getBoundingClientRect();
    const boundingClientRect = {
      top: elementsByTagNameElement.offsetTop,
      left: elementsByTagNameElement.offsetLeft
    }
    const strings = elementsByTagNameElement.id.split('-');
    if (strings[0].includes('Title')) {
      const item = dataList[strings[1]].titleList[strings[2]]
      dataList[strings[1]].titleList[strings[2]] = {
        ...item,
        ...{
          element: elementsByTagNameElement,
          left: boundingClientRect.left,
          top: boundingClientRect.top,
        }
      };
    } else if (strings[0].includes('Description')) {
      const item = dataList[strings[1]].descriptionList[strings[2]]
      dataList[strings[1]].descriptionList[strings[2]] = {
        ...item,
        ...{
          element: elementsByTagNameElement,
          left: boundingClientRect.left,
          top: boundingClientRect.top,
        }
      };
    }
  }
  for (let i = 0; i < elementsByTagName.length; i++) {
    elementsByTagName[i].style.position = 'absolute'
  }
  initChange()
}

onMounted(() => {
  for (let i = 0; i < dataList.length; i++) {
    dataList[i].id = i;
    dataList[i].titleList = []
    dataList[i].descriptionList = []
    const titleList = dataList[i].title.split('');
    const descriptionList = dataList[i].description.split('');
    for (let j = 0; j < titleList.length; j++) {
      dataList[i].titleList.push(
          {
            text: titleList[j],
            randomTop: getTop(),
            randomLeft: getLeft()
          }
      )
    }
    for (let j = 0; j < descriptionList.length; j++) {
      dataList[i].descriptionList.push(
          {
            text: descriptionList[j],
            randomTop: getTop(),
            randomLeft: getLeft()
          }
      )
    }
    dataList[i].isActive = false
  }
  dataList[showNowIndex.value].isActive = true
  if (showTimer.value){
    clearTimeout(showTimer.value)
  }
  showTimer.value=setTimeout(() => {
    initA()
  }, 1500)
})
</script>

<template>
  <div id="mainFontFloat">
    <a>
      <i class="iconfont icon-shangyige" style="font-size: 32px;" @click="preClick"></i>
      <i class="iconfont icon-xiayige" style="font-size: 32px;" @click="nextClick"></i>
    </a>
    <div id="fontFloatCore">
      <div v-for="item in dataList">
          <span v-for="(title,index) in item.titleList" class="fontFloatClass"
                :id="`fontFloatTitle-${item.id}-${index}`">
          {{ title.text }}
          </span>
        <br>
        <span v-for="(description,index) in item.descriptionList" class="fontFloatClass"
              :id="`fontFloatDescription-${item.id}-${index}`">
        {{ description.text }}
        </span>
      </div>
    </div>
  </div>
</template>

<style scoped>
#mainFontFloat {
  position: relative;
  height: 999px;
  padding: 10px;
  word-wrap: break-word;
  text-align: center;
  overflow: hidden;
}

.fontFloatClass {
  color: rgb(221, 221, 221);
  z-index: initial;
  font-size: 28px;
}

#fontFloatCore {
  text-align: center;
}

#fontFloatCore div {
  position: absolute;
  left: 0;
  right: 0;
  top: 50px;
}
</style>