<script setup>
import {onMounted, onUpdated, reactive, ref, nextTick, onBeforeUpdate} from 'vue'

defineProps({})

const count = ref(0)

const dataList = reactive([
  {
    title: '测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多测试文字非常多',
    description: 'd1'
  },
  {title: '你好你好你好你好你好你好', description: 'd2'},
  {title: '大家好才是真的好', description: ''},
])
const showNowIndex = ref(0)

const nextClick = () => {
  showNowIndex.value++
  showNowIndex.value = showNowIndex.value === dataList.length ? 0 : showNowIndex.value
  for (let i = 0; i < dataList.length; i++) {
    dataList[i].isActive = false
  }
  dataList[showNowIndex.value].isActive = true
  changeNow()
}
const changeNow = () => {
  // 激活的动画
  const dataListElement = dataList[showNowIndex.value];
  for (let i = 0; i < dataListElement.titleList.length; i++) {
    const titleObj = dataListElement.titleList[i];
    const element = titleObj.element;
    element.style.background="#ffffff"
    element.style.zIndex="9999"
    console.log(parent)
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
      element.style.background="rgba(255, 255, 255, 0.1)"
      element.style.zIndex="-9999"
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
          {left: startLeft + "px", top: startTop + "px"},
          {left: endLeft + "px", top: endTop + "px"},
        ],
        {duration: 3000, fill: 'forwards'}
    );
  } else {
    rabbitDownKeyframes = new KeyframeEffect(
        element,
        [
          {left: endLeft + "px", top: endTop + "px"},
          {left: startLeft + "px", top: startTop + "px"},
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
  debugger
  const elementById = document.getElementById("fontFloatCore");
  const elementsByTagName = elementById.getElementsByTagName("span");
  for (let i = 0; i < elementsByTagName.length; i++) {
    const elementsByTagNameElement = elementsByTagName[i];
    const boundingClientRect = elementsByTagNameElement.getBoundingClientRect();
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
  changeNow()
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

  setTimeout(() => {
    initA()
  }, 1500)
})
</script>

<template>
  <div id="mainFontFloat">
    <button @click="nextClick">下一个</button>
    <div id="fontFloatCore">
      <div v-for="item in dataList">
          <span v-for="(title,index) in item.titleList" class="fontFloatClass" :id="`fontFloatTitle-${item.id}-${index}`">
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
  overflow: hidden;
  height: 999px;
  padding: 10px;
  word-wrap: break-word;
  text-align: center;
}

.fontFloatClass {
  color: rgb(221, 221, 221);
  z-index: initial;
  font-size: 28px;
}
#fontFloatCore{
  text-align: center;
}
#fontFloatCore div{
  position: absolute;
  left: 0;
  right: 0;
}
</style>