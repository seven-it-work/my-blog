<script setup>
import {onMounted, onUpdated, reactive, ref} from 'vue'

defineProps({})

const count = ref(0)

const dataList = reactive([
  {title: '大家好这里是我的博客大家好这里是我的博客大家好这里是我的博客大家好这里是我的博客大家好这里是我的博客', description: 'd1'},
  {title: '', description: 'd2'},
  {title: '', description: ''},
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
    const randomInfoTitle = document.getElementById(`randomInfoTitle${showNowIndex.value}${i}`);
    neat2Random({
      startTop: titleObj.startTop,
      startLeft: titleObj.startLeft,
      endTop: titleObj.endTop,
      endLeft: titleObj.endLeft
    }, randomInfoTitle)
  }

  for (let i = 0; i < dataListElement.descriptionList.length; i++) {
    const descriptionObj = dataListElement.descriptionList[i];
    const randomInfoDescription = document.getElementById(`randomInfoDescription${showNowIndex.value}${i}`);
    neat2Random({
      startTop: descriptionObj.startTop,
      startLeft: descriptionObj.startLeft,
      endTop: descriptionObj.endTop,
      endLeft: descriptionObj.endLeft
    }, randomInfoDescription)
  }

  // 除了激活的 全部到随机
  dataList.filter(item => !item.isActive).forEach(item => {
    for (let i = 0; i < item.titleList.length; i++) {
      const titleObj = item.titleList[i];
      const randomInfoTitle = document.getElementById(`randomInfoTitle${item.id}${i}`);
      random2Neat({
        startTop: titleObj.startTop,
        startLeft: titleObj.startLeft,
        endTop: titleObj.endTop,
        endLeft: titleObj.endLeft
      }, randomInfoTitle)
    }
    for (let i = 0; i < item.descriptionList.length; i++) {
      const descriptionObj = item.descriptionList[i];
      const randomInfoDescription = document.getElementById(`randomInfoDescription${item.id}${i}`);
      random2Neat({
        startTop: descriptionObj.startTop,
        startLeft: descriptionObj.startLeft,
        endTop: descriptionObj.endTop,
        endLeft: descriptionObj.endLeft
      }, randomInfoDescription)
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
const test = () => {
  // 标题的顶点坐标，计算用
  // const titleNotUse1 = document.getElementById("titleNotUse1");
  // const titleNotUse2 = document.getElementById("titleNotUse2");
  // const titleDifference=titleNotUse2.getBoundingClientRect().left-titleNotUse1.getBoundingClientRect().left
  // console.log(titleDifference)
  // const descriptionNotUse1 = document.getElementById("descriptionNotUse1");
  // const descriptionNotUse2 = document.getElementById("descriptionNotUse2");
  // const descriptionDifference = descriptionNotUse2.getBoundingClientRect().left - descriptionNotUse1.getBoundingClientRect().left
  // console.log(descriptionDifference)
  // const titleDescriptionDifference = titleNotUse1.getBoundingClientRect().top - descriptionNotUse1.getBoundingClientRect().top
  // console.log(titleDescriptionDifference)
}


const random2Neat = ({startTop, startLeft, endTop, endLeft}, element, isReverse = false) => {
  let rabbitDownKeyframes
  if (isReverse) {
    rabbitDownKeyframes = new KeyframeEffect(
        element,
        [
          {left: endLeft + "px", top: endTop + "px"},
          {left: startTop + "px", top: startLeft + "px"},
        ],
        {duration: 3000, fill: 'forwards'}
    );
  } else {
    rabbitDownKeyframes = new KeyframeEffect(
        element,
        [
          {left: startTop + "px", top: startLeft + "px"},
          {left: endLeft + "px", top: endTop + "px"},
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

onUpdated(() => {
  changeNow()
})

onMounted(() => {
  const titleDifference = 32
  const descriptionDifference = 30;
  const titleDescriptionDifference = 40
  const startTop = 200;
  const startLeft = 100;
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
            startTop: startTop + (titleDifference * j),
            startLeft: startLeft,
            endTop: getTop(),
            endLeft: getLeft()
          }
      )
    }
    for (let j = 0; j < descriptionList.length; j++) {
      dataList[i].descriptionList.push(
          {
            text: descriptionList[j],
            startTop: startTop + (descriptionDifference * j),
            startLeft: startLeft + titleDescriptionDifference,
            endTop: getTop(),
            endLeft: getLeft()
          }
      )
    }
    dataList[i].isActive = false
  }
  dataList[showNowIndex.value].isActive = true
})
</script>

<template>
  <div id="mainFontFloat">
    <button @click="nextClick">下一个</button>

    <div v-for="item in dataList" >
      <div style="position:absolute;top: 200px;left: 100px;width: 100px">大家好这里是我的博客大家好这里是我的博客大家好这里是我的博客大家好这里是我的博客大家好这里是我的博客</div>
      <span v-for="(title,index) in item.titleList" :id="`randomInfoTitle${item.id}${index}`" class="floatTitle">
        {{ title.text }}
      </span>
      <span v-for="(description,index) in item.descriptionList" :id="`randomInfoDescription${item.id}${index}`"
            class="floatDescription">
        {{ description.text }}
      </span>
    </div>
  </div>
</template>

<style scoped>
#mainFontFloat{
  position: relative;
  overflow: hidden;
  height: 999px;
}


.floatTitle {
  position: absolute;
  color: rgb(221, 221, 221);
  z-index: initial;
  font-size: 32px;
}

.floatDescription {
  position: absolute;
  color: rgb(221, 221, 221);
  z-index: initial;
  font-size: 28px;
}
</style>